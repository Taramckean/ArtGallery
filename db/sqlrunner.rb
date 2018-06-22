require('pg')
class SqlRunner

  def self.run (sql, values = [])
    begin
      db = PG.connect ({dbname: 'dekagbkcm0qubk',
        host: 'ec2-54-235-253-198.compute-1.amazonaws.com', port: 5432, user: 'tuntpsciumnzng',
        password: '3db5ff07eb73718b6f3c9c2efaed4718edac9930125134a7ab0a859480a64960'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end
end
