require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify
  attr_reader :id

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify == true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publish_date' => @publish_date,
      'on_spotify' => @on_spotify
    }.to_json(*args)
  end
end
