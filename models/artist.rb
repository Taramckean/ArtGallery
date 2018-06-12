require_relative('../db/sqlrunner')

class Artist

  attr_reader :id
  attr_accessor :name, :birth_year, :art_movement

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @birth_year = options['birth_year'].to_i
    @art_movement = options['art_movement']
  end

def save()
  sql = "INSERT INTO artists (name, birth_year, art_movement)
  VALUES ($1, $2, $3)
  RETURNING *"
  values = [@name, @birth_year, @art_movement]
  artist_data = SqlRunner.run(sql, values)
  @id = artist_data.first()['id'].to_i
end

def artworks()
  sql = "SELECT * from artworks where artist_id = $1"
  values = [@id]
  artworks = SqlRunner.run(sql, values)
  result = artworks.map {|artwork| Artwork.new(artwork)}
  return result
end

def self.find(id)
  sql = "SELECT * FROM artists WHERE id = $1"
  values = [id]
  artist = SqlRunner.run(sql, values)
  result = Artist.new(artist.first)
  return result
end

def self.delete(id)
  sql = "DELETE FROM artists where id = $1"
  values = [id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM artists;"
  SqlRunner.run(sql)
end

def self.all()
  sql = "SELECT * FROM artists;"
  artists = SqlRunner.run(sql)
  result = artists.map {|artist| Artist.new(artist)}
  return result
end


end
