module IndividualQueries
  module AuthenFactories
    class Common
      def self.all(current_user = nil)
        Individual.available
      end

      def self.by_office(current_user = nil)
        office = current_user.organization
        condition = <<-SQL

        SQL
        Individual.available.where(condition, organization_id: office.id)
      end
    end
  end
end
