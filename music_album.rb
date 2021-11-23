require_relative 'item'

class MusicAlbum < Item
  DEFAULT_BOOL = false

  attr_accessor :genre, :publish_date

  def initialize(publish_date, on_spotify = DEFAULT_BOOL)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def archived?
    @archived
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
