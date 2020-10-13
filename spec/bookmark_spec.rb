require './lib/bookmark'
require 'pry'

describe Bookmark do
  it 'shows all the bookmarks' do
    Bookmark.create(url: 'http://www.google.com', title: 'Google')
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    expect(Bookmark.all).to include an_instance_of(Bookmark)
  end

  # describe 'create' do
  #   it 'adds a new bookmark' do
  #     bookmark = Bookmark.create(url: 'http://www.netflix.com', title: 'Netflix')
  #     persisted_bookmark = Bookmark.all[0]
  #     expect(bookmark.url).to eq persisted_bookmark.url
  #     expect(bookmark.title).to eq persisted_bookmark.title
  #     expect(bookmark.id).to eq persisted_bookmark.id
  #   end
  # end

  describe 'delete' do
    it 'deletes a bookmark' do
      Bookmark.create(url: 'http://www.google.com', title: 'Google')
      persisted_bookmark = Bookmark.all[0]
      Bookmark.delete(id: persisted_bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end
end
