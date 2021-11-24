
# frozen_string_literal: true

require_relative 'list_options'
require_relative 'add_options'
require_relative 'author'

class App
  include ListOptions
  include AddOptions

  INPT_MSG = 'Enter your option number here --> '

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = [Label.new('title1', 'yellow'), Label.new('title2', 'red'), Label.new('title3', 'green')]
    @labels = []
    @authors = [Author.new('Amine', 'Smahi'), Author.new('Ruben', 'Pire'), Author.new('Ali', 'Abbani')]
    @option = 0
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
    puts "\nExiting session\nThank you for using the Catalog of my Things App!"
  end
end

puts 'Welcome to the Catalog of my Things app!'
App.new.main
