require 'rails_helper'

RSpec.describe Topic, type: :model do
  # Association test
  # ensure Topic model has a one to many relationship with the quizzes model
  it { should have_many(:quizzes).dependent(:destroy) }

  # Validation tests
  # ensure columns title and description are present before saving
  it { should valdiate_presence_of(:title) }
  it { should valdiate_presence_of(:description) }
end