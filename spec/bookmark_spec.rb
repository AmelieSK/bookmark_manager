require './lib/bookmark'

describe Bookmark do
  it 'shows all the bookmarks' do
    conn = PG.connect( dbname: 'bookmark_manager_test' )
    conn.exec( "INSERT INTO bookmarks(url) VALUES('http://www.google.com'), ('http://www.destroyallsoftware.com'), ('http://www.makersacademy.com') ")
    bookmarks = Bookmark.all
    expect(bookmarks).to eq ['http://www.google.com', 'http://www.destroyallsoftware.com', 'http://www.makersacademy.com']
  end
end
