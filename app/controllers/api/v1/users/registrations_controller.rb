class Api::V1::Users::RegistrationsController < Api::V1::BaseController
  def create
    params = individual_user_params
    user = UserServices::RegisterUserService.create(params)
    user_serializer = Api::V1::Users::UserSerializer.new(user).serializable_hash
    json_response(user_serializer)
  end

  private
  def individual_user_params
    params.permit(
      individual: [:full_name, :email, :phone_number, :address, :dob, :city_id, :district_id],
      user: [:username, :email, :phone_number, :password]
    ).to_h
  end
end
