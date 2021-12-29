module Api
  module V1
    class Users::UserSerializer
      include JSONAPI::Serializer
      attributes    :id,
                    :full_name,
                    :dob
      attribute :full_address do

      end
    end
  end
end