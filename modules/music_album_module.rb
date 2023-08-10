require_relative '../app'
require_relative '../classes/item'
require_relative '../classes/music_album'

module MusicAlbumModule
  def create_music_album
    print 'Publish Data (mm-dd-yyyy): '
    publish_date = gets.chomp
    print 'Is it on Spotify? [y/n]: '
    on_spotify = gets.chomp
    music_album_instance = MusicAlbum.new(publish_date, on_spotify)
    @music_albums << music_album_instance

    puts '=========================================='
    puts '🤙 Music Album is created successfully 👍'
    puts '=========================================='
  end

  def list_music_album
    @music_albums.each_with_index do |music_album_instance, index|
      puts "#{index + 1}) Id: '#{music_album_instance.id}'",
           ", Published Date: '#{music_album_instance.publish_date}'",
           ", On Spotify: '#{music_album_instance.on_spotify}'"
    end
  end
end
