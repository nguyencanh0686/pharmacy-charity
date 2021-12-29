module UserServices
  class UserServices

    def self.create(params)
      user_validator = Validations::User::NewUser.new.call(params)
      raise ::ExceptionHandler::Validation, user_validator.errors unless user_validator.errors.blank?
      ::User.create!(params)
    end

  end
end
