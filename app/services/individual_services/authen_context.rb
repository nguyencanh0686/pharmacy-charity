module IndividualServices
  module AuthenContext
    private
    def can_read(current_user)
      IndividualQueries::IndividualQuery.all(current_user)
    end

    def can_create?(current_user)
      true
    end

    def can_modify?(current_user)
      true
    end

  end
end