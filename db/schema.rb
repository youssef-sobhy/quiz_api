# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 20170524153412) do

  create_table "choices", force: :cascade do |t|
    t.string   "choice",                       null: false
    t.boolean  "right_choice", default: false, null: false
    t.integer  "question_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "game_makers", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "first_name",                               null: false
    t.string   "last_name",                                null: false
    t.string   "user_name",                                null: false
    t.string   "email"
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.text     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["email"], name: "index_game_makers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_game_makers_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_game_makers_on_uid_and_provider", unique: true
  end


  create_table "questions", force: :cascade do |t|
    t.text     "question",   null: false
    t.integer  "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "title"
    t.integer  "passing_score"
    t.integer  "topic_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["topic_id"], name: "index_quizzes_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "logo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "",      null: false
    t.string   "uid",                    default: "email", null: false
    t.string   "first_name",                               null: false
    t.string   "last_name",                                null: false
    t.date     "date_of_birth",                            null: false
    t.string   "user_name",                                null: false
    t.string   "email"
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.text     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "picture"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
