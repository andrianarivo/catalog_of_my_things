module ItemModule
  def list_items
    @items.each_with_index do |item, index|
      puts "#{index + 1} #{item}"
    end
  end
end
