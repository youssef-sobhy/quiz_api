require 'rails_helper'


RSpec.describe quiz, :type => :model do
  describe "Associations" do
    it { should belong_to(:topic) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:passing_score) }
    # it { should validate_presence_of(:topic_id) }
  end
end