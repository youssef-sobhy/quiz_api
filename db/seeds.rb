# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: 'Mahmoud', last_name: 'Abdulazim', user_name: 'aze3ma', email: 'aze3ma@gmail.com', password: '12345678', password_confirmation: '12345678', date_of_birth: '01/04/1994')

Topic.create!([
  {title: 'Ruby', description: 'this is the ruby topic'},
  {title: 'JS', description: 'this is the javascript topic'},
  {title: 'Rails', description: 'this is the css topic'}
  ])

Quiz.create!(title: 'General', passing_score: 90, topic_id: 1)
Quiz.create!(title: 'OOP', passing_score: 90, topic_id: 1)
Quiz.create!(title: 'Methods', passing_score: 90, topic_id: 1)

Quiz.create!(title: 'General', passing_score: 90, topic_id: 2)
Quiz.create!(title: 'Closures', passing_score: 90, topic_id: 2)
Quiz.create!(title: 'JQuery', passing_score: 90, topic_id: 2)

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

choices = [
    {choice: 'local variable', right_choice: false, question_id: 1},
    {choice: 'instance variable', right_choice: false, question_id: 1},
    {choice: 'global variable', right_choice: false, question_id: 1},
    {choice: 'class variable', right_choice: true, question_id: 1}
  ]
Question.create!(question: 'The ________ variables are associated with a class and all instances of a class have the same class variable copy', quiz_id: 1, choices_attributes: choices)

choices = [
    {choice: 'raise', right_choice: false, question_id: 2},
    {choice: 'rescue', right_choice: true, question_id: 2},
    {choice: 'ensure', right_choice: false, question_id: 2},
    {choice: 'Exception', right_choice: false, question_id: 2}
  ]
Question.create!(question: 'In ruby __________ clause to handle exception', quiz_id: 1, choices_attributes: choices)

choices = [
    {choice: 'instance', right_choice: false, question_id: 3},
    {choice: 'defined?', right_choice: true, question_id: 3},
    {choice: 'defined', right_choice: false, question_id: 3},
    {choice: 'local', right_choice: false, question_id: 3}
  ]
Question.create!(question: 'In ruby how do you check if a variable is defined or not?', quiz_id: 1, choices_attributes: choices)

# JS:

choices = [
    {choice: 'Both a & b are equal in value, type & reference address', right_choice: false, question_id: 4},
    {choice: 'Both a & b are equal in value', right_choice: false, question_id: 4},
    {choice: 'Both a & b are equal in value & type', right_choice: true, question_id: 4},
    {choice: 'There is no such statement', right_choice: false, question_id: 4}
  ]
Question.create!(question: 'The statement a===b refers to', quiz_id: 4, choices_attributes: choices)

choices = [
    {choice: 'Keywords', right_choice: false, question_id: 5},
    {choice: 'Declaration statements', right_choice: true, question_id: 5},
    {choice: 'Datatypes', right_choice: false, question_id: 5},
    {choice: 'Prototypes', right_choice: false, question_id: 5}
  ]
Question.create!(question: 'The “var” and “function” are', quiz_id: 4, choices_attributes: choices)

choices = [
    {choice: 'When the function is defined as a looping statement', right_choice: false, question_id: 6},
    {choice: 'When the function is predefined', right_choice: false, question_id: 6},
    {choice: 'When the function is defined as expressions', right_choice: true, question_id: 6},
    {choice: 'All of the mentioned', right_choice: false, question_id: 6}
  ]
Question.create!(question: 'When does the function name become optional in JavaScript?', quiz_id: 4, choices_attributes: choices)

choices = [
    {choice: 'It returns the value 0', right_choice: false, question_id: 7},
    {choice: 'It will throw an exception', right_choice: false, question_id: 7},
    {choice: 'It returns the undefined value', right_choice: true, question_id: 7},
    {choice: 'None of the mentioned', right_choice: false, question_id: 7}
  ]
Question.create!(question: 'What will happen if a return statement does not have an associated expression?', quiz_id: 4, choices_attributes: choices)