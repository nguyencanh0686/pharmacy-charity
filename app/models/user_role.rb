class UserRole < ApplicationRecord
  enum role_name: ['admin', 'customer_service', 'office_manager', 'office', 'doctor', 'user']
  belongs_to :user
end
