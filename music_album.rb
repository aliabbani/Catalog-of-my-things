require_relative 'item'

class MusicAlbum < Item
  DEFAULT_BOOL = false

  attr_accessor :genre, :publish_date, :name, :on_spotify

  def initialize(name, publish_date, on_spotify = DEFAULT_BOOL)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
