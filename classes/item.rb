require 'date'

class Item
  attr_accessor :publish_date, :author
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

  private

  def can_be_archived?
    date_now = Date.today.year
    past_date = (Date.parse @publish_date).year
    difference = (past_date - date_now).abs
    difference > 10
  end
end
