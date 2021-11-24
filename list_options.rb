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
      @music_albums.each do |album|
        puts "Genre: #{album.genre}, Author: #{album.author}, Published on: #{@album.publish_date}"
      end
    end
    display_enter_msg
  end

  def list_genres
    puts "\nList of genres:"
    if @genres.empty?
      puts 'EMPTY'
    else
      puts @genres.map { |genre| "Genre: #{genre.name}" }
    end
    display_enter_msg
  end

  def display_enter_msg
    print ENTR_MSG
    gets
  end
end
