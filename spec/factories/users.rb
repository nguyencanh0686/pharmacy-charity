FactoryBot.define do
  factory :user do
    username {"username"}
    individual
  end

  factory :admin_user, class: User do
    individual
    id {'ec9434c7-c78d-4282-8b16-bedb16386ec1'}
    username {"pharmacy_admin"}
    phone_number {"+84909090909"}
    email {"pharmacy_admin@pharmacy.com.vn"}
    password {'12345@Ab'}
  end
end
