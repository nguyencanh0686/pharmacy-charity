module IndividualQueries
  module AuthenFactories
    class Officer < IndividualServices::AuthenFactory::Common

      def self.all(current_user)
        by_office(current_user)
      end

    end
  end
end
