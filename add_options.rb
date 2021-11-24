require_relative 'music_album_input_handler'

module AddOptions
  INPT_MSG = 'Enter your option number here --> '.freeze
  INPT_HERE = 'Input here --> '.freeze
  ENTR_MSG = "\nPress ENTER to continue".freeze

  include MusicAlbumInputHandler

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
    name = music_album_name
    date = music_album_publish_date
    genre = music_album_genre_option
    new_album = if music_album_on_spotify
                  MusicAlbum.new(name, date, true)
                else
                  MusicAlbum.new(name, date)
                end
    genre.add_item(new_album)
    @music_albums << new_album
    puts "\nAlbum added Successfully"
  end

  def add_genre
    puts "\nEnter the album\'s genre"
    print INPT_HERE
    genre = Genre.new(gets.chomp)
    @genres << genre
    genre
  end
end
