module UserQueries
  class UserTokenQuery
    def initialize(token_id, device_ip = nil)
      @token_id = token_id
      @device_ip = device_ip
    end

    def call
      condition = <<-SQL
        EXISTS (
          SELECT 1 FROM user_tokens WHERE users.id = user_tokens.user_id
          AND user_tokens.id = :token_id
          AND expired_at > NOW()
          #{" AND  device_ip = :device_ip " if @device_ip.present? }
        )
      SQL
      User.where(condition, token_id: @token_id, device_ip: @device_ip)
    end
  end
end
