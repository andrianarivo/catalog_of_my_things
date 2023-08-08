require_relative '../classes/book'

module BookModule

  def create_book
    print 'Published date: '
    publish_date = gets.chomp

    print 'Publisher name: '
    publisher = gets.chomp

    print 'Cover state: '
    cover_state = gets.chomp

    @books << Book.new(publish_date, publisher, cover_state)
    puts 'Book has been added successfully'
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Id: '#{book.id}', Published: '#{book.publish_date}', Publisher: '#{book.publisher}', Cover State: '#{book.cover_state}'"
    end
  end

end
