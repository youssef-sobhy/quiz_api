class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :topic

  validates :title,
            :passing_score, presence: true
end
