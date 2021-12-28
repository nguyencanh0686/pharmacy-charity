module Entities
  class IngredientService

    def self.show(id)
      Ingredient.find @id
    end

    def self.search()

    end

  end
end