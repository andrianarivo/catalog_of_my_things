class Item
  attr_accessor :publish_date
  attr_reader :id, :archived

  def initialize
    @id = Random.rand(100...10_000)
  end

  def move_to_archive; end

  private

  def can_be_archived?; end
end
