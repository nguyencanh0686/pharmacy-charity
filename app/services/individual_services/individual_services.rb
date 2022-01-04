module IndividualServices
  class IndividualServices

    extend IndividualServices::AuthenContext

    def self.register(params)
      individual_validator = ::Validations::Individual::NewIndividual.new.call(params)
      raise ::ExceptionHandler::Validation, individual_validator.errors unless individual_validator.errors.blank?

      Individual.create!(params)
    end

    def self.create(params, current_user)
      can_create?(current_user)

      individual_validator = ::Validations::Individual::NewIndividual.new.call(params)
      raise ::ExceptionHandler::Validation, individual_validator.errors unless individual_validator.errors.blank?

      Individual.create!(params)
    end

    def self.show(id, current_user)
      can_read(current_user).find id
    end

    def self.all(params, current_user)
      scopes =  can_read(current_user)
      scopes = scopes.where(

      )
      scopes
    end
  end
end
