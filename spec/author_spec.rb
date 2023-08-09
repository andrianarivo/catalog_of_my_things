require_relative '../classes/author'
require_relative '../classes/item'

RSpec.describe Author do
  before :each do
    @new_author = Author.new('Biftu', 'Girma')
    @new_item = Item.new('01-10-2018')
  end

  describe '#new' do
    it 'returns a new Author object' do
      expect(@new_author).to be_instance_of(Author)
    end
  end

  describe '#first_name' do
    it 'returns the correct first_name' do
      expect(@new_author.first_name).to eql 'Biftu'
    end
  end

  describe '#last_name' do
    it 'returns the correct last_name' do
      expect(@new_author.last_name).to eql 'Girma'
    end
  end

  describe '#add_item' do
    it 'adds the item correctly' do
      @new_author.add_item(@new_item)
      expect(@new_author.items).to include(@new_item)
    end
  end
end
