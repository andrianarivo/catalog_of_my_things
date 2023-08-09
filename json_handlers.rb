module JsonHandlers
  def save_files
    File.write('books.json', @books.to_json)
    File.write('games.json', @games.to_json)
    File.write('music_albums.json', @music_albums.to_json)
    File.write('authors.json', @authors.to_json)
    File.write('labels.json', @labels.to_json)
    File.write('genres.json', @genres.to_json)
  end

  # rubocop:disable Style/GuardClause
  def open_books
    if File.exist?('books.json')
      JSON.parse(File.read('books.json')).map do |book|
        book_object = create_book_object(book)
        @books << book_object
      end
    end
  end

  def open_games
    if File.exist?('games.json')
      JSON.parse(File.read('games.json')).map do |game|
        game_object = create_game_object(game)
        @games << game_object
      end
    end
  end

  def open_music_albums
    if File.exist?('music_albums.json')
      JSON.parse(File.read('music_albums.json')).map do |music|
        publish_date = music['publish_date']
        archived = music['archived'] || nil
        on_spotify = music['on_spotify']
        new_music = MusicAlbum.new(publish_date, on_spotify)
        new_music.move_to_archive unless archived.nil?
        @music_albums << new_music
      end
    else
      []
    end
  end

  # rubocop:enable Style/GuardClause
  def create_game_object(game)
    new_object = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
    new_object.id = game['id'].to_i
    new_object
  end

  def create_book_object(book)
    new_object = Book.new(book['publish_date'], book['publisher'], book['cover_state'])
    new_object.id = book['id'].to_i
    new_object
  end

  def create_music_object(music_album)
    new_object = MusicAlbum.new(music_album['publish_date'], music_album['on_spotify'])
    new_object.id = music_album['id'].to_i
    new_object
  end
end
