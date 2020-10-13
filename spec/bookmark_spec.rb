require './lib/bookmark'
require 'pry'

describe Bookmark do
  it 'shows all the bookmarks' do
    Bookmark.create(url: 'http://www.google.com', title: 'Google')
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    expect(Bookmark.all).to include an_instance_of(Bookmark)
  end

  describe 'create' do
    it 'adds a new bookmark' do
      Bookmark.create(url: 'http://www.netflix.com', title: 'Netflix')
      expect(Bookmark.all).to include an_instance_of(Bookmark)
    end
  end
end
