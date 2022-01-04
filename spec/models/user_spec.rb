require 'rails_helper'

RSpec.describe User, type: :model do
  let(:city ) {create :city}
  let(:districts) {create :districts}
  let(:individual) {create :individual, city: city }
  let(:admin_user) {create :admin_user, individual: individual}

  it { should respond_to :username }
  it { should belong_to :individual}
  it { should have_many  :user_roles}
end
