require 'json'

module Storage
  def load_albums
    json_albums = File.read('./local/music_album.json')
    albums_data = JSON.parse(json_albums)
    albums_data.each do |element|
      album = MusicAlbum.new(element['name'], element['publish_date'], element['on_spotify'])
      full_item = [album, element['genre']]
      @music_albums << album
      @full_items << full_item
    end
  end

  def load_genres
    json_genres = File.read('./local/genre.json')
    genres_data = JSON.parse(json_genres)
    genres_data.each do |element|
      genre = Genre.new(element['name'])
      @genres << genre
    end
  end

  def load_associations
    @full_items.each do |item|
      association_genre = @genres.select { |genre| genre.name == item[1] }.first
      association_genre.add_item(item.first)
    end
  end

  def load_json
    @full_items = []
    load_albums if File.exist?('./local/music_album.json')
    load_genres if File.exist?('./local/genre.json')
    load_associations unless @full_items.empty?
  end

  def save_albums
    File.new('./local/music_album.json', 'a') unless File.exist?('./local/music_album.json')
    albums_arr = []
    @music_albums.each do |album|
      stored_album = {
        name: album.name,
        publish_date: album.publish_date,
        on_spotify: album.on_spotify,
        genre: album.genre.name
      }
      albums_arr << stored_album
    end
    File.write('./local/music_album.json', JSON.dump(albums_arr))
  end

  def save_genres
    File.new('./local/genre.json', 'a') unless File.exist?('./local/genre.json')
    genres_arr = []
    @genres.each do |genre|
      stored_genre = { name: genre.name }
      genres_arr << stored_genre
    end
    File.write('./local/genre.json', JSON.dump(genres_arr))
  end

  def save_items
    save_albums unless @music_albums.empty?
    save_genres unless @genres.empty?
  end
end
