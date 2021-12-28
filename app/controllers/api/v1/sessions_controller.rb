class Api::V1::SessionsController < Api::V1::BaseController

  skip_before_action :authorize_request, only: [:create, :destroy]

  def create
    authorized =  Auth::AuthenticateService.new(auth_params[:login], auth_params[:password]).call
    set_cookie_jwt(authorized.token)
    json_response({},:created)
  end

  def destroy
    cookies.delete :jwt
    json_response({})
  end

  private
  attr_reader :current_account

  def auth_params
    params.permit(:login, :password)
  end

  def set_cookie_jwt(token)
    cookies[:jwt] = {
      value: token,
      httponly: false,
      same_site: :lax,
      secure: false,
      domain: :all
    }
  end
end
