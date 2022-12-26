FactoryBot.define do
  factory :sub_tag do
    name { Faker::Name.name }
    tag { association :tag }
  end
end
