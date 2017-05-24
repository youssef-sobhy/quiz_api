FactoryGirl.define do
  factory :game_maker do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    user_name Faker::Cat.name
    email Faker::Internet.email
    password 'joey1133'
    password_confirmation 'joey1133'
  end
end
