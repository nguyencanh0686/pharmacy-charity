require 'rails_helper'

RSpec.describe "Api::V1::Entities::Ingredients", type: :request do
  describe "GET /index" do

  end

  describe "GET /show" do
    let(:ingredient) {create :ingredient}
    before {
      ingredient
      get "/api/v1/entities/ingredients/#{ingredient.id}"
    }
    it 'Returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'Get only one record' do
      expect(JSON.parse(response.body)["data"].size).to eq(1)
    end
  end

  describe "GET /index" do
    let(:ingredient) {create :ingredient}
    before {
      ingredient
      get "/api/v1/entities/ingredients/#{ingredient.id}"
    }
    it 'Returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'Get only one record' do
      expect(JSON.parse(response.body)["data"].size).to eq(1)
    end
  end

end
