module Auth
  class Standard

    def initialize(login, password, device_ip = nil)
      @login = login
      @password = password
      @device_ip = device_ip
    end

    def call
      @current_account, @current_token ||= begin
        raise(ExceptionHandler::AuthenticationError, I18n.t('authentication.required')) if (login.blank? || password.blank?)
        user = Queries::UserQueries::AuthenticationQuery.new(login).().first
        raise(ExceptionHandler::AuthenticationError, I18n.t('authentication.invalid_credentials')) unless account.present?
        raise(ExceptionHandler::AuthenticationError, I18n.t('authentication.invalid_credentials')) unless account && account.valid_password?(password)
        token = user.user_tokens.create!(
          device_ip: device_ip,
          datetime: Time.zone.now + TOKEN_EXPIRED_IN
        )
        user, token
      end
    end

    private
    attr_reader :current_account, :login, :password, :current_token
  end
end