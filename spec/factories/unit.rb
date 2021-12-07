FactoryBot.define do
  factory :unit do
    sequence(:number)
    floor_plan { Unit::VALID_FLOOR_PLANS.sample }
  end
end
