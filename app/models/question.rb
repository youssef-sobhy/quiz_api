class Question < ApplicationRecord
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  belongs_to :quiz

  validates :question, presence: true
  validates :choices, length: { minimum: 4, maximum: 4 }
end
