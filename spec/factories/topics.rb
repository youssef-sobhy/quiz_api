FactoryGirl.define do
  factory :topic do
    title Faker::Space.planet
    description Faker::Lorem.paragraph
  end 

  factory :invalid_topic, class: Topic do
    title Faker::Space.planet
    description ""
  end

  factory :topic_updated, class: Topic do
    title Faker::Space.planet
    description Faker::Lorem.paragraph
  end
end