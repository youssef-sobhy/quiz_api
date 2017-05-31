class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :user_answers
  has_many :scores

  belongs_to :topic

  validates :title,
            :passing_score, presence: true
end
