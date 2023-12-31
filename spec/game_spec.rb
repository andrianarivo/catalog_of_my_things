require_relative '../classes/game'
require_relative '../classes/item'

describe Game do
  before :all do
    @item = Item.new('07-08-2021')
    @game = Game.new('multi', '07-08-2023', @item.publish_date)
  end

  describe '#new' do
    it 'takes parameters and returns a item object' do
      expect(@item).to be_an_instance_of(Item)
    end
  end

  describe '#new' do
    it 'takes parameters and returns a game object' do
      expect(@game).to be_an_instance_of(Game)
    end

    it 'check if game inherits Item' do
      expect(@game).to be_kind_of Item
    end
  end

  describe '#move_to_archive' do
    it 'check if private method is overridden' do
      expect(@game.move_to_archive).to be false
    end
  end
end
