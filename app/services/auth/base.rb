module Auth
  class Base
    attr_reader  :current_account,  :current_token, :jwt_token

    private
    def encode_payload
      @jwt_token ||= JsonWebToken.encode({
        user_id: @current_account.id,
        email: @current_account.email,
        #role: @current_account.roles&.map(&:name),
        token_id: @current_token.id,
        device_ip: @device_ip
      })
    end
  end
end
