require 'pg'

conn = PG.connect( dbname: 'bookmark_manager' )
conn.exec( "SELECT * FROM bookmarks" ) do |result|
  result.each do |row|
    p row["url"]
  end
end
