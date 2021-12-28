class City < ApplicationRecord
  validates_presence_of :name, :national

  has_many :districts
  belongs_to :national
end
