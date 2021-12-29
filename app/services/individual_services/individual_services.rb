module IndividualServices
  class IndividualServices
    def self.create(params)
      individual_validator = ::Validations::Individual::NewIndividual.new.call(params)
      raise ::ExceptionHandler::Validation, individual_validator.errors unless individual_validator.errors.blank?

      Individual.create!(params)
    end

  end
end
