require 'rails_helper'

RSpec.describe GameMaker, type: :model do
  context 'validations' do
    it 'is not valid without first name' do
      game_maker = build(:game_maker, first_name: '')

      expect(game_maker.valid?).to be false
    end

    it 'is not valid without last name' do
      game_maker = build(:game_maker, last_name: '')

      expect(game_maker.valid?).to be false
    end

    it 'is not valid without game_maker name' do
      game_maker = build(:game_maker, user_name: '')

      expect(game_maker.valid?).to be false
    end

    it 'is not valid if game_maker name already exists' do
      game_maker_1 = create(:game_maker, user_name: 'joey1337')
      game_maker_2 = build(:game_maker, user_name: 'joey1337', email: 'joe@gmail.com')

      expect(game_maker_2.valid?).to be false
    end

    it 'is not valid if email already exists' do
      game_maker_1 = create(:game_maker, email: 'joe1337@gmail.com')
      game_maker_2 = build(:game_maker, email: 'joe1337@gmail.com', user_name: 'joe')

      expect(game_maker_2.valid?).to be false
    end
  end
end
