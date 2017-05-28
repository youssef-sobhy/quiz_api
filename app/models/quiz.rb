class Quiz < ApplicationRecord
  belongs_to :topic

  validates :title, :passing_score, presence: true
end
