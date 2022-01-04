module IndividualQueries
  module AuthenFactories
    class Admin < IndividualServices::AuthenFactory::Common

      def self.all(current_user = nil)
        supper(current_user)
      end
    end
  end
end
