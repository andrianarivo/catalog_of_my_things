require_relative 'modules/game_module'
require_relative 'modules/music_album_module'
require_relative 'modules/genre_module'
require_relative 'modules/author_module'

class App
  include GameModule
  include MusicAlbumModule
  include GenreModule
  include AuthorModule

  def initialize
    @games = []
    @music_albums = []
    @genres = []
    @authors = []
  end

  def first_run(option)
    case option
    when 2
      list_music_album
    when 3
      list_games
    when 4
      list_all_genres
    when 6
      list_authors
    else
      second_run(option)
    end
  end

  def second_run(option)
    case option
    when 8
      create_music_album
    when 9
      create_game
    when 10
      create_genre
    when 12
      create_author
    else
      puts 'Thank you for using this app!'
      exit
    end
  end
end
