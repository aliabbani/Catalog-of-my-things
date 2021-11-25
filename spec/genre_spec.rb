require_relative 'spec_helper'

describe Genre do
  before :each do
    @music_album_a = MusicAlbum.new('Hello', Date.new(2005, 0o3, 21), true)
    @music_album_b = MusicAlbum.new('Goodbye', Date.new(2010, 11, 0o5))
    @pop = Genre.new('Pop')
    @hard_rock = Genre.new('Hard Rock')
  end

  it 'creates an instance of genre' do
    expect(@pop).to be_an_instance_of Genre
  end

  it 'adds a genre to an item' do
    @pop.add_item(@music_album_a)
    expect(@music_album_a.genre.name).to eql 'Pop'
  end

  it 'adds an item to a genre' do
    @hard_rock.add_item(@music_album_b)
    expect(@hard_rock.items.first).to eql @music_album_b
  end

  it 'adds two items to a genre' do
    @pop.add_item(@music_album_a)
    @pop.add_item(@music_album_b)
    expect(@pop.items.length).to eql 2
  end
end
