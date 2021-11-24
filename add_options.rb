module AddOptions
  INPT_MSG = 'Enter your option number here --> '.freeze
  INPT_HERE = 'Input here --> '.freeze
  ENTR_MSG = "\nPress ENTER to continue".freeze

  def initialize
    @add_item_option = 0
  end

  def add_item_options
    puts "\nWhich items do you wish to add?"
    puts '1 - Add Book'
    puts '2 - Add Music album'
    puts '3 - Add Game'
  end

  def add_item_select
    case @add_item_option
    when 1
      add_book
    when 2
      add_music_album
    when 3
      add_game
    else
      "\nSorry, I didn\'t get you quite well..."
    end
  end

  def add_item
    until [1, 2, 3].include?(@add_item_option)
      add_item_options
      print INPT_MSG
      @add_item_option = gets.chomp.to_i
      add_item_select
    end
    @add_item_option = 0
  end

  def add_music_album
    puts "\nWhat is the name of the album?"
    print INPT_HERE
    name = gets.chomp
    puts "When was the album published? [YYYY-MM-DD]"
    print INPT_HERE
    date = Date.parse(gets.chomp)
    puts "\nSelect a genre or add one"
    @genres.each_with_index { |genre, index| puts "#{index}) Genre: #{genre.name}" }
    puts "#{@genres.length}) Add new genre"
    print INPT_MSG
    option = gets.chomp.to_i
    if option == @genres.length
      genre = add_genre
    else
      genre = @genres[option]
    end
    puts 'Is the album in Spotify? [Y/N]'
    print INPT_HERE
    if gets.chomp.upcase == 'Y'
      new_album = MusicAlbum.new(date, true)
      genre.add_item(new_album)
      @music_albums << new_album
    else
      new_album = MusicAlbum.new(date)
      genre.add_item(new_album)
      @music_albums << new_album
    end
  end

  def add_genre
    puts "Enter the album\'s genre"
    print INPT_HERE
    genre = Genre.new(gets.chomp)
    @genres << genre
    genre
  end
end
