require_relative('../db/sqlrunner')

class Artwork

attr_reader :id
attr_accessor :title, :materials, :category, :creation_year, :image, :artist_id

def initialize(options)
  @id = options['id'].to_i
  @title = options['title']
  @materials = options['materials']
  @category = options['category']
  @creation_year = options['creation_year'].to_i
  @image = options['image']
  @artist_id = options['artist_id']
end

def save()
  sql = "INSERT INTO artworks (title, materials, category,
  creation_year, image, artist_id)   VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING *"
  values = [@title, @materials, @category, @creation_year, @image, @artist_id]
  artwork_data = SqlRunner.run(sql, values)
  @id = artwork_data.first()['id'].to_i
end

def delete()
  sql = "DELETE FROM artworks where id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM artworks;"
  SqlRunner.run(sql)
end

def self.all()
  sql = "SELECT * FROM artworks"
  artworks = SqlRunner.run(sql)
  result = artworks.map {|artwork| Artwork.new(artwork)}
  return result
end

def self.find(id)
  sql = "SELECT * FROM artworks WHERE id = $1"
  values = [id]
  artwork = SqlRunner.run(sql, values)
  result = Artwork.new(artwork.first)
  return result
end

def update()
  sql = "UPDATE artworks SET (title, materials, category,
  creation_year, image, artist_id)
  = ($1, $2, $3, $4, $5, $6)
  WHERE id = $7"
  values = [@title, @materials, @category, @creation_year, @image, @artist_id, @id]
  SqlRunner.run(sql, values)
end


end
