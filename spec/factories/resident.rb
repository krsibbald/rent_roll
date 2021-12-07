FactoryBot.define do
  factory :resident do
    name { Faker::Name.name }
  end
end
