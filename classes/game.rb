require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    date_now = Date.today.year
    past_date = (Date.parse publish_date).year
    last_played = (Date.parse last_played_at).year
    published_difference = (past_date - date_now).abs
    last_played_at_difference = (date_now - last_played).abs
    published_difference > 10 && last_played_at_difference > 2
  end
end
