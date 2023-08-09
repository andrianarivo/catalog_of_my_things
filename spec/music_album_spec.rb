require_relative '../classes/music_album'

RSpec.describe MusicAlbum do
  describe '#move_to_archive' do
    context 'when the album can be archived' do
      it 'archives the album' do
        # Set up
        ten_years_ago = Date.today - (10 * 365)
        puts "DEBUG: ten_years_ago = #{ten_years_ago}"
        album = MusicAlbum.new(ten_years_ago, archived: false)

        # Exercise
        album.move_to_archive

        # Verify
        expect(album.archived).to be true
      end
    end

    context 'when the album cannot be archived' do
      it 'does not archive the album' do
        # Set up
        album = MusicAlbum.new(Date.today, archived: false)

        # Exercise
        album.move_to_archive

        # Verify
        expect(album.archived).to be false
      end
    end
  end
end
