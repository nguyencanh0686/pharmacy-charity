module Auth
  class Standard
    def initialize(login, password)
      @login = login
      @password = password
    end

    def call
      @current_account ||= begin
        raise(ExceptionHandler::AuthenticationError, I18n.t('authentication.required')) if (login.blank? || password.blank?)
        account = Queries::Users::AuthenticationQuery.new(login).()
        raise(ExceptionHandler::AuthenticationError, I18n.t('authentication.invalid_credentials')) unless account.present?
        raise(ExceptionHandler::AuthenticationError, I18n.t('authentication.invalid_credentials')) unless account && account.valid_password?(password)
        account
      end
    end

    private
    attr_reader :current_account, :login, :password
  end
end