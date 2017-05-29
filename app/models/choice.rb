class Choice < ApplicationRecord
  belongs_to :question, optional: true

  validates :choice, presence: true
end
