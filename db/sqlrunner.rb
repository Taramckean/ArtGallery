require('pg')
class SqlRunner

  def self.run (sql, values = [])
    begin
      db = PG.connect ({dbname: 'd7ntu329ugjmht', host: 'ec2-50-19-86-139.compute-1.amazonaws.com'
        ,port: 5432, user:'evrrfxulbumenn', password: 'a33f60a0ae3bbf18849c292a863681bb27d45997eb294ca010986063c31dca6e'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end
end
