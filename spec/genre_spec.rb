require_relative '../classes/genre.rb' # Adjust the path as per your project structure

RSpec.describe Genre do
  # The following method allows us to create a new instance of the Genre class before each test.
  # This helps us avoid test interdependency.
  let(:genre_name) { 'Test Genre' }
  let(:genre) { Genre.new(genre_name) }

  describe '#initialize' do
    it 'creates a new Genre object with a random ID' do
      expect(genre.name).to eq(genre_name)
      expect(genre.id).to be_an(Integer)
    end

    it 'initializes the items array as an empty array' do
      expect(genre.items).to be_an(Array)
      expect(genre.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the items array' do
      item = double('Item')
      allow(item).to receive(:genre=).with(genre) 
      genre.add_item(item)

      expect(genre.items).to include(item)
    end

    it 'does not add the same item again' do
      item = double('Item')
      allow(item).to receive(:genre=).with(genre)
      genre.add_item(item)
      genre.add_item(item)

      expect(genre.items.count(item)).to eq(1)
    end

    it 'sets the genre of the added item to self' do
      item = double('Item')
      expect(item).to receive(:genre=).with(genre)
      genre.add_item(item)
    end
  end
end
