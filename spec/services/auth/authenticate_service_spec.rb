require 'rails_helper'
RSpec.describe Auth::AuthenticateService do
  describe "Sign In with username and password" do
    let(:national) {create :national}
    let(:city) {create :city, national: national}
    let(:district) {create :district, city: city}

    let(:individual) {create :individual, city: city, district: district}
    let(:user) {create :user, individual: individual}

    context "Sign In successfuly" do
      it "checking return user" do
        authentication =  Auth::AuthenticateService.new(user.username, user.password, '120.1.90.100').call()
        expect(authentication.current_account.username).to eq(user.username)
        expect(authentication.current_token.device_ip).to eq('120.1.90.100')
      end
    end

    context "Sign In fail" do
      subject(:wrong_username) { Auth::AuthenticateService.new('user.username', user.password, '120.1.90.100').call()}
      subject(:wrong_password) { Auth::AuthenticateService.new(user.username, 'user.password', '120.1.90.100').call()}

      it "checking wrong_username" do
        expect {wrong_username}.to raise_error(::ExceptionHandler::AuthenticationError)
      end

      it "checking wrong_password" do
        expect {wrong_password}.to raise_error(::ExceptionHandler::AuthenticationError)
      end
    end
  end


end