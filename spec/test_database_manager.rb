require 'pg'

def truncate_test_db
  conn = PG.connect( dbname: 'bookmark_manager_test' )
  conn.exec( 'TRUNCATE TABLE bookmarks' )
end
