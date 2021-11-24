require_relative 'spec_helper'

describe MusicAlbum do
  before :each do
    @music_album_a = MusicAlbum.new(Date.new(2005, 0o3, 21), true)
    @music_album_b = MusicAlbum.new(Date.new(2010, 11, 0o5))
  end

  it 'creates an instance of MusicAlbum' do
    expect(@music_album_a).to be_an_instance_of MusicAlbum
  end

  it 'allows a MusicAlbum instance to archive' do
    expect(@music_album_a.send(:can_be_archived?)).to be true
  end

  it 'keeps a MusicAlbum instance to be archived' do
    expect(@music_album_b.send(:can_be_archived?)).to be false
  end
end
