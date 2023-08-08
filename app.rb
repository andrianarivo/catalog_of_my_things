require_relative 'modules/game_module'
require_relative 'modules/music_album_module'
require_relative 'modules/genre_module'

class App
  include GameModule
  include MusicAlbumModule
  include GenreModule

  def initialize
    @games = []
    @music_albums = []
    @genres = []
  end

  def run(option)
    case option
    when 2
      list_music_album
    when 3
      list_games
    when 4
      list_all_genres
    when 8
      create_music_album
    when 9
      create_game
    when 10
      create_genre
    else
      puts 'Thank you for using this app!'
      exit
    end
  end
end
