require 'pg'

class Bookmark

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )
    else
      conn = PG.connect( dbname: 'bookmark_manager')
    end
    conn.exec( "SELECT * FROM bookmarks" ) do |result|
      result.map do |row|
       row["url"]
      end
    end
  end

  def self.create(url:,title:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )
    else
      conn = PG.connect( dbname: 'bookmark_manager')
    end


    begin
      conn.exec("INSERT INTO bookmarks(url) VALUES('#{:url}')")
    rescue PG::Error => e
      puts e.message
    ensure
      conn.close
    end
  end
end
