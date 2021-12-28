require 'rails_helper'
RSpec.describe UserServices::RegisterUserService do
  describe "Register new user" do
    let(:national) {create :national}
    let(:city) {create :city, national: national}
    let(:params) {
      {
        "username": "FrankNguyen",
        "full_name": "Frank Nguyen",
        "email": "franknguyen@gmail.com",
        "phone_number": "+84932925767",
        "password": "12345@Ab",
        "city_id": city.id
      }
    }

    let(:missing_phone_number) {
      {
        "full_name": "Frank Nguyen",
        "email": "franknguyen@gmail.com",
        "city_id": city.id
      }
    }

    let(:missing_username) {
      {
        "full_name": "Frank Nguyen",
        "email": "franknguyen@gmail.com",
        "phone_number": "+84932925767",
        "city_id": city.id
      }
    }

    context "test create a new user successful" do
      subject { UserServices::RegisterUserService.create(params)}
      its(:email) { should eql("franknguyen@gmail.com") }
      its(:phone_number) { should eql("+84932925767") }
      its(:full_name) { should eql("Frank Nguyen") }
    end

    context "test create a new user fail " do
      subject(:missing_phone_number_object) { UserServices::RegisterUserService.create(missing_phone_number)}
      subject(:missing_username_object) { UserServices::RegisterUserService.create(missing_username)}

      it "raise an exception - invalid entity" do
        expect {missing_phone_number_object}.to raise_error(Dry::Struct::Error)
      end

      it "raise an exception - invalid user" do
        expect {missing_username_object}.to raise_error(Dry::Struct::Error)
      end
    end

  end
end