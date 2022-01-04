class OrganizationOfficer < ApplicationRecord

  belongs_to :organization
  belongs_to :individual

end
