class Individual < ApplicationRecord
  validates :full_name, :email, :phone_number,  presence: true
  belongs_to :city
  belongs_to :district, optional: true
end
