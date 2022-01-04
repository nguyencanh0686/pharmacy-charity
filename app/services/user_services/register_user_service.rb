module UserServices
  class RegisterUserService

    def self.create(params)
      individual_params = params[:individual]
      user_params = params[:user]
      ::User.transaction do
        individual = IndividualServices::IndividualServices.create(individual_params)
        return UserServices.create(user_params.merge(individual_id: individual.id))
      end
    end

    def self.show(id)

    end
  end
end
