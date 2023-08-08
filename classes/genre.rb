require './item.rb'
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
        @items << item
        item.genre = self
    end
end