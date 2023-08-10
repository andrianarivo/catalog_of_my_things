require 'fileutils'

BOOK_FILE = 'data/books.json'.freeze
LABEL_FILE = 'data/labels.json'.freeze
MUSIC_ALBUM_FILE = 'data/music_album.json'.freeze
GENRE_FILE = 'data/genres.json'.freeze
GAME_FILE = 'data/games.json'.freeze
AUTHOR_FILE = 'data/authors.json'.freeze

module DataManager
  def save_files
    directory_name = 'data'
    FileUtils.mkdir_p(directory_name)
    File.write(BOOK_FILE, @books.to_json)
    File.write(GAME_FILE, @games.to_json)
    File.write(MUSIC_ALBUM_FILE, @music_albums.to_json)
    File.write(AUTHOR_FILE, @authors.to_json)
    File.write(LABEL_FILE, @labels.to_json)
    File.write(GENRE_FILE, @genres.to_json)
  end

  # rubocop:disable Style/GuardClause
  def load_books
    @books = []
    if File.exist?(BOOK_FILE)
      JSON.parse(File.read(BOOK_FILE)).map do |book|
        book_object = create_book_object(book)
        @books << book_object
        @items << book_object
      end
    end
  end

  def load_games
    @games = []
    if File.exist?(GAME_FILE)
      JSON.parse(File.read(GAME_FILE)).map do |game|
        game_object = create_game_object(game)
        @games << game_object
        @items << game_object
      end
    end
  end

  def load_music_albums
    @music_albums = []
    if File.exist?(MUSIC_ALBUM_FILE)
      JSON.parse(File.read(MUSIC_ALBUM_FILE)).map do |music|
        publish_date = music['publish_date']
        archived = music['archived'] || nil
        on_spotify = music['on_spotify']
        new_music = MusicAlbum.new(publish_date, on_spotify)
        new_music.move_to_archive unless archived.nil?
        @music_albums << new_music
        @items << new_music
      end
    end
  end

  def load_labels
    @labels = []
    if File.exist?(LABEL_FILE)
      JSON.parse(File.read(LABEL_FILE)).map do |label|
        label_object = create_label_object(label)
        @labels << label_object
      end
    end
  end

  def load_genres
    @genres = []
    if File.exist?(GENRE_FILE)
      JSON.parse(File.read(GENRE_FILE)).map do |genre|
        genre_object = create_genre_object(genre)
        @genres << genre_object
      end
    end
  end

  def load_authors
    @authors = []
    if File.exist?(AUTHOR_FILE)
      JSON.parse(File.read(AUTHOR_FILE)).map do |author|
        author_object = create_author_object(author)
        @authors << author_object
      end
    end
  end

  private

  # rubocop:enable Style/GuardClause
  def create_game_object(game)
    Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
  end

  def create_book_object(book)
    Book.new(book['publish_date'], book['publisher'], book['cover_state'])
  end

  def create_music_object(music_album)
    MusicAlbum.new(music_album['publish_date'], music_album['on_spotify'])
  end

  def create_label_object(label)
    Label.new(label['title'], label['color'])
  end

  def create_genre_object(genre)
    Genre.new(genre['name'])
  end

  def create_author_object(author)
    Author.new(author['first_name'], author['last_name'])
  end
end
