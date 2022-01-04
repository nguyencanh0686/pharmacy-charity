module IndividualQueries
  class IndividualQuery

    def self.all(params, current_user)
      user_role = user.current_sign_in_with
      klass = IndividualServices::AuthenFactory::Factory.get(user_role)
      klass.all
    end

  end
end
