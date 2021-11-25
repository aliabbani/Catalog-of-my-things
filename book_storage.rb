require_relative 'book'
require 'json'

module BookStorage
  def parse_books
    File.open('books.json', 'w') { |f| f.write JSON.generate([]) } unless File.exist? 'books.json'

    JSON.parse(File.read('books.json')).map do |book|
      @books << Book.new(book['publisher'], book['cover_state'], book['publish_date'])
    end
  end

  def save_books
    @json_books = []
    @books.each do |book|
      @json_books.push({ 'publisher' => book.publisher, 'cover_state' => book.cover_state,
                         'publish_date' => book.publish_date })
    end
    File.write('books.json', JSON.generate(@json_books))
  end
end
