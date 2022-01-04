module UserQueries
  class AuthenticationQuery
    def initialize(login, model = User)
      @login = login
      @model = model
    end

    def call
      @model.includes(relations).active_only
                                .activated
                                .by_login(@login)
    end

    private
    def relations
      [
        :user_roles
      ]
    end

  end
end
