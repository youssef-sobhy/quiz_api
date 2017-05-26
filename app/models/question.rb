class Question < ApplicationRecord
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  belongs_to :quiz

  validates :question, presence: true
end
