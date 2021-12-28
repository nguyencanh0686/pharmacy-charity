require 'rails_helper'

RSpec.describe Individual, type: :model do
  let(:city ) {create :city}
  let(:districts) {create :districts}
  let(:individual) {create :individual, city: city }

  it { should respond_to :full_name }
  it { should respond_to :email }
  it { should belong_to :city}

  it { should validate_presence_of :full_name }
  it { should validate_presence_of :phone_number }
  it { should validate_presence_of :email }
end
