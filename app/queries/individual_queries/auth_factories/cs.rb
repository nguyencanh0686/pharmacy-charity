module IndividualQueries
  module AuthenFactories
    class Cs < IndividualServices::AuthenFactory::Common
      def self.all(current_user)
        supper(current_user)
      end
    end
  end
end
