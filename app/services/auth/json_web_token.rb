module Auth
  class JsonWebToken
    HMAC_SECRET = ENV['JWT_SECRET_TOKEN']

    def self.encode(payload, exp = 100.days.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, HMAC_SECRET)
    end

    def self.decode(token)
      body = JWT.decode(token, HMAC_SECRET)[0]
      HashWithIndifferentAccess.new body
      rescue JWT::DecodeError => e
        raise ExceptionHandler::InvalidToken, e.message
    end
  end
end