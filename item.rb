require 'date'

class Item
  attr_accessor :genre, :author, :publish_date
  
  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    Date.today > @publish_date.next_year(10)
  end
end
