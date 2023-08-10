require_relative '../classes/label'
require_relative '../classes/item'

RSpec.describe Label do
  before :each do
    @new_label = Label.new('test', 'red')
    @new_item = Item.new('2020-10-10')
  end

  describe '#new' do
    it 'returns a new Label object' do
      expect(@new_label).to be_instance_of(Label)
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(@new_label.title).to eql 'test'
    end
  end

  describe '#color' do
    it 'returns the correct color' do
      expect(@new_label.color).to eql 'red'
    end
  end

  describe '#add_item' do
    it 'adds the item correctly' do
      @new_label.add_item(@new_item)
      expect(@new_label.items).to include(@new_item)
    end
  end
end
