require 'date'

module MusicAlbumInputHandler
  INPT_MSG = 'Enter your option number here --> '.freeze
  INPT_HERE = 'Input here --> '.freeze
  ENTR_MSG = "\nPress ENTER to continue".freeze

  def music_album_name
    puts "\nEnter the album's name:"
    print INPT_HERE
    gets.chomp
  end

  def music_album_publish_date
    date_str = ''
    until date_valid?(date_str)
      puts "\nEnter the album's publish date in the format [YYYY-MM-DD]"
      print INPT_HERE
      date_str = gets.chomp
      puts "\nPlease enter a valid date" unless date_valid?(date_str)
    end
    Date.parse(date_str)
  end

  def music_album_genre_option
    return add_genre if @genres.empty?
    puts "\nSelect the album's genre"
    list_genres
    puts "#{@genres.length}) New genre"
    print INPT_HERE
    option = gets.chomp.to_i
    music_album_genre(option)
  end

  def music_album_on_spotify
    puts "\nIs the album in Spotify? [Y/N]"
    print INPT_HERE
    return true if gets.chomp.upcase == 'Y'
    false
  end

  private

  def date_valid?(date_str)
    Date.parse(date_str)
    true
  rescue ArgumentError
    false
  end

  def music_album_genre(option)
    return add_genre if option == @genres.length
    @genres[option]
  end
end
