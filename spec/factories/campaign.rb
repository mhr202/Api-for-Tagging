FactoryBot.define do
  factory :campaign do
    title { Faker::Name.name }
    purpose { Faker::Name.name }
    duration { 'within 1 week' }
    user { association :user }
  end
end
