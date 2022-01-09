module Auth
  class Standard

    def initialize(login, password, device_ip = nil)
      @login = login
      @password = password
      @device_ip = device_ip
    end

    def call

      raise(ExceptionHandler::AuthenticationError, I18n.t('authentication.required')) if (login.blank? || password.blank?)
      @current_account = UserQueries::AuthenticationQuery.new(login).().first
      raise(ExceptionHandler::AuthenticationError, I18n.t('authentication.invalid_credentials')) unless @current_account.present?
      raise(ExceptionHandler::AuthenticationError, I18n.t('authentication.invalid_credentials')) unless @current_account && @current_account.valid_password?(password)
      @current_token = @current_account.user_tokens.create(
        {
          device_ip: device_ip,
          expired_at: Time.zone.now + TOKEN_EXPIRED_IN
        }
      )

      return @current_account, @current_token
    end

    private
    attr_reader :current_account, :login, :password, :current_token, :device_ip
  end
end
