require 'rails_helper'
RSpec.describe Auth::TokenAuthenticateService do
  describe "Sign In with token" do
    let(:national) {create :national}
    let(:city) {create :city, national: national}
    let(:district) {create :district, city: city}

    let(:individual) {create :individual, city: city, district: district}
    let(:user) {create :user, individual: individual}

    context "Sign In successfuly" do
      it "checking return user" do
        authentication =  Auth::AuthenticateService.new(user.username, user.password, '120.1.90.100').call()

        authentication_token =  Auth::TokenAuthenticateService.new(authentication.jwt_token).call()
        expect(authentication_token.current_account.username).to eq(user.username)
        expect(authentication_token.current_token.device_ip).to eq('120.1.90.100')
      end
    end

    context "Sign In fail" do
      subject(:authentication) { Auth::AuthenticateService.new(user.username, user.password, '120.1.90.100').call()}
      subject(:wrong_authentication) { Auth::TokenAuthenticateService.new(authentication.jwt_token + "SALT").call()}

      it "checking fail authenticate by token" do
        expect {wrong_authentication}.to raise_error(::ExceptionHandler::InvalidToken)
      end
    end
  end


end