module Auth
  class AuthenticateService < Base
    def initialize(login, password, device_ip = nil)
      @login = login
      @password = password
      @device_ip = device_ip
    end

    def call
      @current_account, @current_token = Auth::Standard.new(@login, @password, @device_ip).call
      encode_payload if @current_account.present?
      self
    end
  end
end
