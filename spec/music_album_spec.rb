require_relative '../classes/music_album.rb'
require_relative '../classes/item.rb'

describe MusicAlbum do
  before :all do
    @item = Item.new('21-01-2019')
    @music_album = MusicAlbum.new(@item.publish_date, true)
  end

  describe '#new' do
    it 'takes parameters and returns a item object' do
      expect(@item).to be_an_instance_of(Item)
    end
  end

  describe '#new' do
    it 'takes parameters and returns music album object' do
      expect(@music_album).to be_an_instance_of(MusicAlbum)
    end
  end

  describe '#move_to_archive' do
    it 'check if item can be archived' do
      expect(@item.move_to_archive).to be false
    end
  end
end