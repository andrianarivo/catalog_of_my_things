class Author
  attr_accessor :first_name, :last_name
  attr_reader :items

  def initialize(first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item unless @items.include? item
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'items' => @items
    }.to_json(*args)
  end
end
