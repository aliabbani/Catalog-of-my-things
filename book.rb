require './item'

class Book < Item
    attr_reader :publisher, :cover_state

    def initialize(publisher, cover_state, genre, author, label, publish_date)
        super(genre, author, label, publish_date)
        @publisher = publisher
        @cover_state = cover_state
        @archived = false
    end

    def can_be_archived?
        super || cover_state == 'bad'
    end
end

# book1 = Book.new('publisher1', 'bad', 'drama', 'jobran khalil', 'red', '2014/10/23')
# puts book1.publisher
# puts book1.cover_state

# puts book1.can_be_archived?