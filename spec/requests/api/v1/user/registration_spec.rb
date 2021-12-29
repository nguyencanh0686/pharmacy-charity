require 'rails_helper'

RSpec.describe "Api::V1::User::Registration", type: :request do
  describe "POST /api/v1/users/registrations" do
    describe "Register new user successfully" do
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
      let(:url) {"/api/v1/users/registrations"}

      before {
        national
        city
        post url, params: params
      }

      context "Attributes of response" do
        subject {JSON.parse(response.body)["data"]}
        its(["type"]) { should eq("user") }
        its(["attributes"]) {should have_key("full_name")}
        its(["attributes"]) {should have_key("dob")}

        context "all attributes" do
          subject {JSON.parse(response.body)["data"]["attributes"]}
          its("keys") { should eql(["id", "full_name", "dob", "full_address"]) }
        end

      end
    end
  end
end