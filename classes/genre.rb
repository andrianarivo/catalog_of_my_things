require_relative 'item'

class Genre < Item
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    super()
    @id = rand(100...10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless items.include?(item)
    item.genre = self
  end
end
