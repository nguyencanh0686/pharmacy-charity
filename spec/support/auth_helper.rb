module AuthHelper
  def http_login
    payload = {
      account_id:  "ec9434c7-c78d-4282-8b16-bedb16386ec1",
      email: "agri_core@agrico.com",
      token_id: "1a0c05f358943f2c94"
    }
    request.env['HTTP_AUTHORIZATION'] = UserServices::JsonWebToken.encode(payload)
  end
end

RSpec.configure do |config|
  config.include AuthHelper, :type => :controller
end
