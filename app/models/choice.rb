class Choice < ApplicationRecord
  belongs_to :question, optional: true
  has_many :user_answers

  validates :choice, presence: true
end
