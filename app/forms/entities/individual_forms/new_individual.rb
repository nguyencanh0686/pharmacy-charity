module Entities
  module IndividualForms
    class NewIndividual < Dry::Struct
      attribute :full_name, Types::String
      attribute :email, Types::String
      attribute :phone_number, Types::String
      attribute :city_id, Types::Integer
    end
  end
end