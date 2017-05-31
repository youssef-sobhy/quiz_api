# frozen_string_literal: true

# Defines a user class
class User < ActiveRecord::Base
  has_many :user_answers
  has_many :scores

  # Include default devise modules.
  devise :database_authenticatable,
         :registerable,
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
