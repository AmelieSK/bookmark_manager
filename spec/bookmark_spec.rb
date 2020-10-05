require './lib/bookmark'

describe Bookmark do
  it 'shows all the bookmarks' do
    bookmark = Bookmark.all
    expect(bookmark).to eq ['Google', 'Yahoo', 'Github']
  end
end
