require_relative 'list_options'
require_relative 'add_options'
require_relative 'music_album'
require_relative 'genre'
require_relative 'author'
require_relative 'book_storage'
require_relative 'music_album_storage'
require_relative 'book'
require_relative 'storage'
require 'json'

class App
  include ListOptions
  include AddOptions
  include BookStorage
  include Storage
  include MusicAlbumStorage

  INPT_MSG = 'Enter your option number here --> '.freeze

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = [Label.new('title1', 'yellow'), Label.new('title2', 'red'), Label.new('title3', 'green')]
    @labels = []
    @authors = [Author.new('Amine', 'Smahi'), Author.new('Ruben', 'Pire'), Author.new('Ali', 'Abbani')]
    @option = 0
    load_json
  end

  def display_options
    puts "\nEnter the number of the input you would like"
    puts '1 - List items'
    puts '2 - List genres'
    puts '3 - List labels'
    puts '4 - List authors'
    puts '5 - Add item'
    puts '6 - Exit'
  end

  def select_option
    case @option
    when 1
      list_items
    when 2
      list_genres
      display_enter_msg
    when 3
      list_labels
    when 4
      list_authors
    when 5
      add_item
    when 6
      exit_app
    else
      puts 'We didn\'t get you quite well...'
      display_options
    end
  end

  def main
    parse_games
    parse_books
    until @option == 6
      display_options
      print INPT_MSG
      @option = gets.chomp.to_i
      select_option
    end
  end

  def list_authors
    @authors.each do |author|
      puts "Id: #{author.id} | First name: #{author.first_name}| Last name: #{author.last_name}"
    end
  end

  def exit_app
    save_games
    save_books
    puts "\nExiting session\nThank you for using the Catalog of my Things App!"
    save_items
  end
end

puts 'Welcome to the Catalog of my Things app!'
App.new.main
