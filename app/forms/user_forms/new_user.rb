module UserForms
  class NewUser < Dry::Struct
    attribute :username, Types::String
    attribute :email, Types::String
    attribute :phone_number, Types::String
    attribute :individual_id, Types::String
    attribute :password, Types::String
  end
end
