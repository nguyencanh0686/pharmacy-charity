FactoryBot.define do
  factory :ingredient do
    name {"Ingredient name"}
    uses {"Ingredient uses"}
    contraindications { "contraindications" }
    side_effectes {"Side effectes"}
  end
end
