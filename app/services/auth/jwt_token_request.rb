module Auth
  class JwtTokenRequest
    def initialize(auth_token)
      @auth_token = auth_token
    end

    def call
      valid_expired_token
      current_account
    end

    private
    attr_reader :auth_token, :current_account

    def current_account
      @current_account ||= ::Users::Account.find(decoded_auth_token[:account_id])
      rescue ActiveRecord::RecordNotFound => e
        raise(
          ExceptionHandler::InvalidToken,
          ("#{I18n.t('authentication.invalid_token')} #{e.message}")
        )
    end

    def valid_expired_token
      if current_account.authentication_token != decoded_auth_token[:token_id]
        raise(ExceptionHandler::ExpiredToken, I18n.t('authentication.expired_token'))
      end
    end

    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end

    def http_auth_header
      return auth_token if auth_token.present?
      raise(ExceptionHandler::MissingToken, I18n.t('authentication.missing_token'))
    end
  end
end
