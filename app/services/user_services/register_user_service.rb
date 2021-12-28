module UserServices

  class RegisterUserService

    def self.create(params)
      individual_form = ::Entities::IndividualForms::NewIndividual.new(params)
      individual_validator = ::Validations::Individual::NewIndividual.new.call(params)

      raise ::ExceptionHandler::Validation unless individual_validator.errors.blank?

      ::User.transaction do
        individual = ::Individual.new(individual_form.to_h)
        if individual.save!
          user_form = ::UserForms::NewUser.new(params.merge(individual_id: individual.id))
          user_validator = Validations::User::NewUser.new.call(user_form.to_h)

          raise ::ExceptionHandler::Validation unless user_validator.errors.blank?

          return ::User.create!(user_form.to_h)
        end
      end
    end
  end
end
