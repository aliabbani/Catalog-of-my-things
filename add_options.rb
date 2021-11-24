require './book'
require './label'

module AddOptions
  INPT_MSG = 'Enter your option number here --> '.freeze
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
    until [1, 2, 3, 4].include?(@add_item_option)
      add_item_options
      print INPT_MSG
      @add_item_option = gets.chomp.to_i
      add_item_select
    end
    @add_item_option = 0
  end

  def add_music_album
    puts "\nAdd of music albums:"
    print ENTR_MSG
    gets
  end

  def add_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover State: '
    cover_state = gets.chomp
    def date_input
      print 'Please enter a publish Date (format YYYY-MM-DD): '
      publish_date = gets.chomp
      if publish_date =~ /\d{4}-\d{1,2}-\d{1,2}$/
        puts "You entered: #{publish_date}"
      else
        puts "#{publish_date} is not a valid date."
        date_input
      end
    end
    book = Book.new(publisher, cover_state, date_input)
    @books << book
    puts 'Book added successfully'
  end
end
