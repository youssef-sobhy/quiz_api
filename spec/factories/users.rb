FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    user_name Faker::Cat.name
    date_of_birth Faker::Date.birthday(15, 70)
    email Faker::Internet.email
    password 'joey5599'
    password_confirmation 'joey5599'
  end
end
