class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :individual
  has_many :user_roles
  has_many :user_tokens

  delegate :full_name, to: :individual
  delegate :dob, to: :individual
  delegate :full_address, to: :individual

  scope :by_login, ->(login){
    where("UPPER(username) = UPPER(:login) OR UPPER(phone_number) = UPPER(:login)", login: login)
  }

  scope :active_only, ->{
    where(deleted_at: nil)
  }

  scope :activated, -> {
    where("confirmed_at IS NOT NULL")
  }

end
