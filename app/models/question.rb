class Question < ApplicationRecord
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  belongs_to :quiz

  validates :question, presence: true
  validates :choices, length: { minimum: 4, maximum: 4 }
  validate :at_least_one_true_choice

  private

  def at_least_one_true_choice
    unless choices.any? { |choice| choice.right_choice == true }
      return errors.add :base, 'Must have at least one true choice'
    end
  end
end
