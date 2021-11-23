require_relative 'music_album'

class Genre
  attr_reader :name

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
