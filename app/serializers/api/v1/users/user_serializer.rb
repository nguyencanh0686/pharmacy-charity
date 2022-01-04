module Api
  module V1
    class Users::UserSerializer
      include JSONAPI::Serializer
      attributes    :id,
                    :full_name,
                    :dob,
                    :full_address
    end
  end
end