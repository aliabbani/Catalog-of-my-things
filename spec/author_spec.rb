# frozen_string_literal: true

require_relative '../author'
require_relative '../item'
require 'date'

describe Author do
  before :each do
    @date = Date.new(2018, 0o1, 0o2)
    @item = Item.new(@date)
    @author = Author.new('Amine', 'Smahi')
  end

  describe '#new' do
    it 'has an instance' do
      expect(@author).to be_an_instance_of Author
    end
  end

  describe 'Can Add Item' do
    it 'can add 1 item' do
      item = Item.new(@date)
      @author.add_item item
      expect(@author.items).to include(item)
    end

    it 'can add 2 items' do
      first_item = Item.new(@date)
      seconed_item = Item.new(@date)
      @author.add_item first_item
      @author.add_item seconed_item
      expect(@author.items).to include(first_item, seconed_item)
    end

    it 'changes the item author' do
      @author.add_item @item
      expect(@item.author).to eql(@author)
    end
  end
end
