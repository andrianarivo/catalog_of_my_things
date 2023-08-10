require_relative '../classes/book'

module BookModule
  def create_book
    print 'Published date (mm-dd-yyyy): '
    publish_date = gets.chomp

    print 'Publisher name: '
    publisher = gets.chomp

    print 'Cover state (good/bad): '
    cover_state = gets.chomp

    new_book = Book.new(publish_date, publisher, cover_state)
    @books << new_book
    @items << new_book
    puts '======================================='
    puts '🤙 Book has been added successfully 👍'
    puts '======================================='
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index + 1} #{book}"
    end
  end
end
