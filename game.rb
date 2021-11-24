require_relative 'item'
require 'date'

class Game < Item
  attr_reader :last_player_at

  def initialize(publish_date, multi_player, last_player_at)
    super(publish_date)
    @multi_player = multi_player
    @last_player_at = last_player_at
  end

  private

  def can_be_archived?
    super() && Date.today > @last_player_at.next_year(2)
  end
end
