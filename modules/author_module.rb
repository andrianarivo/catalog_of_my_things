require_relative '../classes/author'
require_relative 'item_module'

module AuthorModule
  include ItemModule

  def create_author
    print 'First Name:'
    first_name = gets.chomp
    print 'Last Name:'
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    @authors << new_author
    link_author_item(new_author)
    puts '======================================='
    puts '🤙    author created successfully!   👍'
    puts '======================================='
  end

  def link_author_item(author)
    puts 'choose one item by index (NOT ID) to link with this Author: '
    list_items
    item_idx = gets.chomp.to_i
    author.add_item(@items[item_idx - 1])
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
