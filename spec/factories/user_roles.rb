FactoryBot.define do
  factory :user_role do

  end

  factory :admin_user_role do
    user
    role_name {"admin"}
    scopes {{}}
  end
end
