FactoryBot.define do
  factory :topic do
    title { Faker::Name.name }
    campaign { association :campaign }
  end
end
