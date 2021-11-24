require 'date'
require './game.rb'

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
    puts "Pleae enter the publish date of the game:"
    date = enter_date
    publish_date = Date.new(date[0], date[1], date[2])
    puts "Is it multi_player:"
    multi_player = gets.chomp
    puts "the date of the last player"
    date = enter_date
    last_player_at = Date.new(date[0], date[1], date[2])
    @games << Game.new(publish_date, multi_player, last_player_at)
    puts "Game is added succussfully"
  end

  def enter_date
    puts "Year: "
    year = gets.chomp
    puts "Month: "
    month = gets.chomp
    puts "Day: "
    day = gets.chomp
    [year.to_i, month.to_i, day.to_i]
  end
end
