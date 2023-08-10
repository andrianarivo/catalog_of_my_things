require_relative '../app'
require_relative '../classes/item'
require_relative '../classes/genre'

module GenreModule
  def create_genre
    print 'Chooose Genre\'s Name: '
    name = gets.chomp
    genre = Genre.new(name)
    @genres << genre

    puts '======================================='
    puts '🤙   Genre is successfully added!!   👍'
    puts '======================================='
  end

  def list_all_genres
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}) Id: '#{genre.id}', Name: '#{genre.name}'"
    end
  end
end
