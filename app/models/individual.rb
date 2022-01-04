class Individual < ApplicationRecord

  validates :full_name, :email, :phone_number,  presence: true
  belongs_to :city
  belongs_to :district, optional: true

  has_one :user
  has_many :organization_officer

  scope :available, ->{
    where(deleted_at: nil)
  }

  def full_address

  end

end
