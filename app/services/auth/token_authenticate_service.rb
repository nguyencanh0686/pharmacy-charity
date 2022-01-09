module Auth
  class TokenAuthenticateService < Base
    def initialize(jwt_token)
      @jwt_token = jwt_token
    end

    def call
      @current_account, @current_token = Auth::JwtTokenRequest.new(@jwt_token).call
      encode_payload if @current_account.present?
      self
    end

  end
end
