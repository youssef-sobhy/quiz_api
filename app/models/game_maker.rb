# frozen_string_literal: true

# Defines a game maker class
class GameMaker < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable,
          :recoverable,
          :rememberable,
          :validatable

  include DeviseTokenAuth::Concerns::User

  validates_presence_of :first_name,
                          :last_name,
                          :user_name

  validates_uniqueness_of :user_name,
                          :email
end
