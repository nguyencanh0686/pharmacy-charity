require 'rails_helper'

RSpec.describe National, type: :model do

  let(:national) { create :national }
  let(:national_without_name) { create :national }

  it "is valid with valid attributes" do
    expect(national).to be_valid
  end

  it "should return correct information" do
    expect(national.name).to eq "Việt Nam"
  end

  it "is invalid with valid attributes" do
    national_without_name.name = nil
    expect(national_without_name).not_to be_valid
  end

  it { should respond_to :name }
  it { should have_many  :cities}

end
