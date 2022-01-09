module Auth
  class JwtTokenRequest
    def initialize(auth_token)
      @auth_token = auth_token
    end

    def call
      @current_token ||= UserToken.find(decoded_auth_token[:token_id])
      raise(
        ExceptionHandler::InvalidToken,
        ("#{I18n.t('authentication.invalid_token')} #{e.message}")
      ) unless @current_token \
          && @current_token.expired_at > Time.zone.now \
          && @current_token.device_ip = decoded_auth_token[:device_ip]

      @current_account ||= @current_token.user
      raise(
        ExceptionHandler::InvalidToken,
        ("#{I18n.t('authentication.invalid_token')} #{e.message}")
      ) unless @current_account

      return @current_account, @current_token
    end


    private
    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end

    def http_auth_header
      return @auth_token if @auth_token.present?
      raise(ExceptionHandler::MissingToken, I18n.t('authentication.missing_token'))
    end
  end
end
