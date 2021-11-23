require_relative '../book'

describe Book do
  before(:each) do
    @book1 = Book.new('publisher1', 'bad', '2010/10/23')
  end

  it 'is an instance of the class?' do
    expect(@book1).to be_instance_of Book
  end

  it 'Check if book is part of item' do
    expect(@book1).to be_kind_of Item
  end

  it 'Check the publisher of the book' do
    expect(@book1.publisher).to eql 'publisher1'
  end

  it 'Check the cover_state of the book' do
    expect(@book1.cover_state).to eql 'bad'
  end
end
