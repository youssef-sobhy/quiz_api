# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
topics = Topic.create!([
  {title: 'Ruby', description: 'this is the ruby topic'},
  {title: 'JS', description: 'this is the javascript topic'},
  {title: 'CSS', description: 'this is the css topic'}
  ])
Quiz.create!(title: 'Methods', passing_score: 90, topic_id: 1)
User.create!(user_name: 'joey1337',
            first_name: 'youssef',
            last_name: 'sobhy',
            date_of_birth: '11/07/1994',
            email: 'joey1337@gmail.com',
            password: 'joey1337',
            password_confirmation: 'joey1337')
GameMaker.create!(user_name: 'admin1337',
                 first_name: 'admin',
                 last_name: 'admin',
                 email: 'admin1337@gmail.com',
                 password: 'admin1337',
                 password_confirmation: 'admin1337')
