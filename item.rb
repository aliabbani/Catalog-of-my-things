require 'date'

class Item
    DEFAULT_BOOL = false.freeze

    attr_accessor :archived, :publish_date

    def initialize(genre, author, label, publish_date, archived = DEFAULT_BOOL)
        @id = Random.rand(1..1000)
        @author = author
        @label = label
        date_arr = publish_date.split('/')
        date_arr = date_arr.map { |input| input.to_i }
        @publish_date = Date.new(date_arr.first, date_arr[1], date_arr.last)
        @archived = archived
    end

    def can_be_archived?
        Date.today > @publish_date.next_year(10)
    end

    def move_to_archive
        @archived = can_be_archived?
    end
end
