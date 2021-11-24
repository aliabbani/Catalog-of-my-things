module ListOptions
  INPT_MSG = 'Enter your option number here --> '.freeze
  ENTR_MSG = "\nPress ENTER to continue".freeze

  def initialize
    @list_item_option = 0
  end

  def list_item_options
    puts "\nWhich items do you wish to list?"
    puts '1 - Books'
    puts '2 - Music albums'
    puts '3 - Games'
  end

  def list_item_select
    case @list_item_option
    when 1
      list_books
    when 2
      list_music_albums
      display_enter_msg
    when 3
      list_games
    else
      "\nSorry, I didn\'t get you quite well..."
    end
  end

  def list_items
    until [1, 2, 3].include?(@list_item_option)
      list_item_options
      print INPT_MSG
      @list_item_option = gets.chomp.to_i
      list_item_select
    end
    @list_item_option = 0
  end

  def list_music_albums
    puts "\nList of music albums:"
    if @music_albums.empty?
      puts 'EMPTY'
    else
      @music_albums.each.with_index(1) do |album, index|
        puts "#{index}) Album: #{album.name}, Genre: #{album.genre.name}, Published on: #{album.publish_date}"
      end
    end
  end

  def list_genres
    puts "\nList of genres:"
    if @genres.empty?
      puts 'EMPTY'
    else
      @genres.each.with_index(1) { |genre, index| puts "#{index}) Genre: #{genre.name}" }
    end
  end

  def display_enter_msg
    print ENTR_MSG
    gets
  end

  def list_games
    if @games.empty?
      puts 'No games exist'
    else
      @games.each do |game|
        puts "Game Id: #{game.id} | Publish date: #{game.publish_date} | Last player was at: #{game.last_player_at}"
      end
    end
  end
end
