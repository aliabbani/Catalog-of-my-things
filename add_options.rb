require 'date'
require './game'

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
    until [1, 2, 3].include?(@add_item_option)
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

  def add_game
    puts 'Pleae enter the publish date of the game:'
    publish_date = enter_date
    puts 'Is it multi_player:'
    multi_player = gets.chomp
    puts 'The date of the last player:'
    last_player_at = enter_date
    @games << Game.new(publish_date, multi_player, last_player_at)
    puts 'Game is added succussfully'
  end

  def enter_date
    puts 'Year (yyyy): '
    year = gets.chomp.to_i
    puts 'Month (1-12): '
    month = gets.chomp.to_i
    puts 'Day (1-31): '
    day = gets.chomp.to_i
    begin
      date = Date.new(year, month, day)
    rescue 
      puts "Be sure that you entered the correct date format\n
      Please repeat again:"
      enter_date
    else
      return date
    end 
  end
end
