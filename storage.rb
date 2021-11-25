require './game'

module Storage
  def get_games
    File.open('games.json', 'w') { |f| f.write JSON.generate([]) } unless File.exist? 'games.json'

    JSON.parse(File.read('games.json')).map do |game|
      @games << Game.new(game['publish_date'], game['multi_player'], game['last_player_at'])
    end
  end

  def save_games
    @json_games = []
    @games.each do |game|
      @json_games.push({ 'json_class' => 'Game', 'publish_date' => game.publish_date,
                         'last_player_at' => game.last_player_at })
    end
    File.write('games.json', JSON.generate(@json_games))
  end
end
