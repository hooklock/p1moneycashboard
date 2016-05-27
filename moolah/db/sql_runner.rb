require('pg')
class SqlRunner

  def self.run( sql )
    begin
      db = PG.connect( {dbname: 'd6guu4ljtn00ku', host: 'ec2-54-243-201-116.compute-1.amazonaws.com', port: 5432, user: 'dsavqepdflwpam', password: 'wA7fOff6vLQg3Q61I3MzMrVJa7'})
      result = db.exec( sql )
    ensure
      db.close
    end
    return result
  end

end