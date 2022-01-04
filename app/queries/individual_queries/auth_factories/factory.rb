module IndividualQueries
  module AuthenFactories
    class Factory

      CUSTOMER_SERVICE = 'customer_service'.freeze
      ADMIN = 'admin'.freeze
      OFFICE_MANAGER = 'office_manager'.freeze
      OFFICER = 'officer'.freeze

      PLATFORM_MAP = {
        CUSTOMER_SERVICE => IndividualServices::AuthenFactory::Cs,
        ADMIN => IndividualServices::AuthenFactory::Admin,
        OFFICE_MANAGER => IndividualServices::AuthenFactory::OfficeManager,
        OFFICER => IndividualServices::AuthenFactory::Officer
      }

      def self.get(user_role)
        adapter = PLATFORM_MAP[user_role]
        raise "Role  = #{user_role} is not recognized." unless adapter
        adapter
      end
    end
  end
end
