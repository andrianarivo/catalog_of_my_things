require 'date'

class Item
  attr_accessor :publish_date, :author, :genre, :label
  attr_reader :id, :archived

  def initialize(publish_date, archived: true)
    @id = Random.rand(100...10_000)
    @archived = archived
    @publish_date = publish_date
  end

  def move_to_archive
    return @archived = true if can_be_archived?

    @archived = false
  end

  def to_s
    "[#{self.class.name}] ID: #{@id} publish date: #{@publish_date} archived: #{@archived ? 'Y' : 'N'}"
  end

  private

  def can_be_archived?
    date_now = Date.today.year
    past_date = Date.parse(@publish_date).year
    difference = (date_now - past_date).abs
    difference >= 10
  end
end
