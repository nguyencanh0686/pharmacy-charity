class Ingredient < ApplicationRecord
  validates :name, :uses, :contraindications, :side_effectes,  presence: true
end
