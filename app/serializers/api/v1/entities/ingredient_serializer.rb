module Api
  module V1
    class Entities::IngredientSerializer
      include JSONAPI::Serializer
      attributes    :id,
                    :name
    end
  end
end