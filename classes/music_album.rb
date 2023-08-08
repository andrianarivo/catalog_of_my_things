require './item.rb'

class MusicAlbum < Item
    attr_accessor :on_spotify
    def initialize(on_spotify)
        super()
        @on_spotify = on_spotify
    end
    def can_be_archived?
        super && on_spotify == true
    end
end