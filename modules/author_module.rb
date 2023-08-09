require_relative '../classes/author'

module AuthorModule
  def create_author(item = nil)
    print 'First Name:'
    first_name = gets.chomp
    print 'Last Name:'
    last_name = gets.chomp
    if item.nil?
      @authors << Author.new(first_name, last_name)
    else
      new_author = Author.new(first_name, last_name)
      new_author.add_item(item)
      @authors << new_author
    end
  end

  def list_authors
    @authors.each_with_index do |author, index|
      puts '------------------------------- '
      puts 'Authors: '
      puts '------------------------------- '
      puts "#{index + 1}) Name: '#{author.first_name} #{author.last_name}'"
      puts '------------------------------- '
    end
  end
end
