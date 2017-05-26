# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
topics = Topic.create([
  {title: 'Ruby', description: 'this is the ruby topic'},
  {title: 'JS', description: 'this is the javascript topic'},
  {title: 'CSS', description: 'this is the css topic'}
  ])
Quiz.create(title: 'Methods', passing_score: 90, topic_id: 1)
