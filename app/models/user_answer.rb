class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :choice
  belongs_to :quiz
end
