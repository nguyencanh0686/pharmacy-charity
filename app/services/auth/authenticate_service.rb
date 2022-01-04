module Auth
  class AuthenticateService
    def initialize(auth_token, device_ip = nil)
      @auth_token = auth_token
      @device_ip = device_ip
    end

    def initialize(login, password)
      @login = login
      @password = password
    end

    def call
      return Auth::JwtTokenRequest.new(auth_token, device_ip).call if auth_token.present?
      @current_account, @current_token = Auth::Standard.new(login, password).call
      self
    end

    private
    attr_reader :auth_token, :login, :password, :current_account, :device_ip, :current_token

    def payload
      {
        user_id: current_user.id,
        email: current_user.email,
        role: current_user.roles&.map(&:name),
        token_id: current_token.id,
        device_ip: device_ip
      }
    end

  end
end
