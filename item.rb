require 'date'

class Item
  attr_accessor :publish_date, :items
  attr_reader :id

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    date_arr = publish_date.split('/')
    date_arr = date_arr.map(&:to_i)
    @publish_date = Date.new(date_arr.first, date_arr[1], date_arr.last)
    @archived = false
    @items
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    Date.today > @publish_date.next_year(10)
  end
end
