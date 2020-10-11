require './lib/bookmark'

describe Bookmark do
  it 'shows all the bookmarks' do
    conn = PG.connect( dbname: 'bookmark_manager_test' )
    conn.exec( "INSERT INTO bookmarks(url) VALUES('http://www.google.com'), ('http://www.destroyallsoftware.com'), ('http://www.makersacademy.com') ")
    bookmarks = Bookmark.all
    expect(bookmarks).to eq ['http://www.google.com', 'http://www.destroyallsoftware.com', 'http://www.makersacademy.com']
  end

  describe 'create' do
    it 'adds a new bookmark' do
      bookmark=Bookmark.create(url: 'http://www.netflix.com', title: 'Netflix').first
      p "URLLLL #{bookmark}"

      expect(bookmark[:url]).to eq 'http://www.netflix.com'
      expect(bookmark[:title]).to eq 'Netflix'
    end
  end
end
