require 'rails_helper'
RSpec.describe UserServices::RegisterUserService do
  describe "Register new user" do
    let(:national) {create :national}
    let(:city) {create :city, national: national}
    let(:params) {
      {
        "individual": {
          "full_name": "Frank Nguyen",
          "email": "franknguyen@gmail.com",
          "phone_number": "+84932925767",
          "address": "Luy Ban Bich - Hoa Thanh",
          "city_id": city.id
        },
        "user": {
          "username": "FrankNguyen",
          "email": "franknguyen@gmail.com",
          "phone_number": "+84932925767",
          "password": "12345@Ab",
        }
      }
    }

    let(:wrong_individual_params) {
      {
        "individual": {
          "full_name": "Frank Nguyen",
          "email": "franknguyen@gmail.com",
          "phone_number": "+84932925767",
          "address": "Luy Ban Bich - Hoa Thanh"
        },
        "user": {
          "username": "FrankNguyen",
          "email": "franknguyen@gmail.com",
          "phone_number": "+84932925767",
          "password": "12345@Ab",
        }
      }
    }
    let(:wrong_user_params) {
      {
        "individual": {
          "full_name": "Frank Nguyen",
          "email": "franknguyen@gmail.com",
          "phone_number": "+84932925767",
          "address": "Luy Ban Bich - Hoa Thanh",
          "city_id": city.id
        },
        "user": {
          "email": "franknguyen@gmail.com",
          "phone_number": "+84932925767",
          "password": "12345@Ab",
        }
      }
    }

    context "test create a new user successful" do
      subject { UserServices::RegisterUserService.create(params)}
      its(:email) { should eql("franknguyen@gmail.com") }
      its(:phone_number) { should eql("+84932925767") }
      its(:full_name) { should eql("Frank Nguyen") }
    end

    context "test create a new user fail " do
      subject(:wrong_individual) { UserServices::RegisterUserService.create(wrong_individual_params)}

      it "raise an exception - invalid entity" do
        expect {wrong_individual}.to raise_error(::ExceptionHandler::Validation)
      end

      subject(:wrong_user) { UserServices::RegisterUserService.create(wrong_user_params)}

      it "raise an exception - invalid entity" do
        expect {wrong_user}.to raise_error(::ExceptionHandler::Validation)
      end
    end
  end
end