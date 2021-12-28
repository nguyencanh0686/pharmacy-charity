module Validations
  module User
    class NewUser < Dry::Validation::Contract
      params do
        required(:username).value(:string)
        required(:email).value(:string)
        required(:phone_number).value(:string)
        required(:password).value(:string)
        required(:individual_id).filled(:string)
      end

      rule(:email) do
        unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
          key.failure('has invalid format')
        end
      end

    end
  end
end