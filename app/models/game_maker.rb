# frozen_string_literal: true

# Defines a game maker class
class GameMaker < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable,
          :recoverable,
          :rememberable,
          :validatable

  include DeviseTokenAuth::Concerns::User

  validates :first_name,
            :last_name,
            :user_name, presence: true

  validates :user_name,
            :email, uniqueness: true
end
