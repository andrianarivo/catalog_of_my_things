class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    super()
    @id = Random.rand(100...10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless items.include?(item)
    item.genre = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name,
      'items' => @items
    }.to_json(*args)
  end
end
