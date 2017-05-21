class Topic < ApplicationRecord
  has_many :quizes, dependent: :destroy
end
