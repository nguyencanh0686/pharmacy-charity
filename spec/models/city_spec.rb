require 'rails_helper'

RSpec.describe City, type: :model do
  let(:national) { create :national }
  let(:city) { create :city, national: national }

  let(:invalid_city) { create :city}

  it { should respond_to :name }

  it { should belong_to :national}
  it { should have_many  :districts}

  describe "Validations" do
    it { should validate_presence_of(:national) }

    it "is valid with valid attributes" do
      expect(city).to be_valid
    end

    it "is invalid with valid attributes" do
      invalid_city.name = nil
      expect(invalid_city).not_to be_valid
    end
  end

end
