require_relative '../classes/book'
require_relative '../classes/item'

RSpec.describe Book do
  before :each do
    @new_book = Book.new('2022-10-12', 'HBO', 'good')
  end

  describe '#new' do
    it 'returns a new Book object' do
      expect(@new_book).to be_instance_of(Book)
    end

    it 'returns a kind of Item' do
      expect(@new_book).to be_kind_of Item
    end
  end

  describe '#publisher' do
    it 'returns the correct publisher' do
      expect(@new_book.publisher).to eql 'HBO'
    end
  end

  describe '#cover_state' do
    it 'returns the correct cover_state' do
      expect(@new_book.cover_state).to eql 'good'
    end
  end

  describe '#can_be_archived' do
    it 'returns the correct value of can_be_archived?' do
      expect(@new_book.send(:can_be_archived?)).to be false
    end
  end
end
