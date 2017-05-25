require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'is not valid without first name' do
      user = build(:user, first_name: '')

      expect(user.valid?).to be false
    end

    it 'is not valid without last name' do
      user = build(:user, last_name: '')

      expect(user.valid?).to be false
    end

    it 'is not valid without user name' do
      user = build(:user, user_name: '')

      expect(user.valid?).to be false
    end

    it 'is not valid if user name already exists' do
      user_1 = create(:user, user_name: 'joey1337')
      user_2 = build(:user, user_name: 'joey1337', email: 'joe@gmail.com')

      expect(user_2.valid?).to be false
    end

    it 'is not valid if email already exists' do
      user_1 = create(:user, email: 'joe1337@gmail.com')
      user_2 = build(:user, email: 'joe1337@gmail.com', user_name: 'joe')

      expect(user_2.valid?).to be false
    end
  end
end
