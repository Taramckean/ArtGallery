require_relative('../db/sqlrunner')

class Artist

  attr_reader :id
  attr_accessor :name, :birth_year, :art_movement

  def initialize(options)
    @id = options['id'].to_i
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

def delete()
  sql = "DELETE FROM artists where id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM artists;"
  SqlRunner.run(sql)
end

def self.all()
  sql = "SELECT * FROM artists;"
  result = artists.map {|artist| Artist.new(artist)}
  return result
end


end
