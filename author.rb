# frozen_string_literal: true

class Author
  attr_reader :first_name, :last_name, :id
  attr_accessor :items

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item
  end
end
