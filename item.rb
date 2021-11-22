class Item
    def initialize(genre, author, label, publish_date, archived = false)
        @id = Random.rand(1..1000)
        @author = author
        @label = label
        @publish_date = publish_date
    end
end