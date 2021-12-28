module Validations
  module Individual
    class NewIndividual < Dry::Validation::Contract
      params do
        required(:full_name).filled(:string)
        required(:email).value(:string)
        required(:phone_number).value(:string)
        required(:city_id).value(:integer)
      end

      rule(:email) do
        unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
          key.failure('has invalid format')
        end
      end

    end
  end
end