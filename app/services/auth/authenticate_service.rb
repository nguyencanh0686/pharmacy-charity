module Auth
  class AuthenticateService
    def initialize(auth_token)
      @auth_token = auth_token
    end

    def initialize(login, password)
      @login = login
      @password = password
    end

    def call
      return UserServices::UserAuthenticator::JwtTokenRequest.new(auth_token).call if auth_token.present?
      @current_account = UserServices::UserAuthenticator::Standard.new(login, password).call
      self
    end

    private
    attr_reader :auth_token, :login, :password, :current_account

    def set_access_token(token_id)
      @current_user.update_attributes({authentication_token: token_id})
    end

    def payload
      {
        user_id: current_user.id,
        email: current_user.email,
        role: current_user.roles&.map(&:name),
        seller_id: current_user.seller_id,
        token_id: token_id
      }
    end

    def token_id
      @token_id ||= SecureRandom.hex(9)
    end

  end
end