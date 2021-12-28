module Entities
  INGREDIENT_COLUMNS = ::Ingredient.column_names.map(&:to_sym)

  class Base
    include Virtus.model
    include ActiveModel::Validations

    class Ingredient < Base
      attribute :id, String
      attribute :name, String
      attribute :uses, String
      attribute :contraindications, String
      attribute :side_effectes, String

      private

      def ingredient
        fail NotImplementedError
      end
    end
  end

end
