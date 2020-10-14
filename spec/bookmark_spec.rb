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

  describe 'update' do
    it 'updates the name and url of a bookmark' do
      Bookmark.create(url: 'http://www.google.com', title: 'Google')
      persisted_bookmark = Bookmark.all[0]
      Bookmark.update(id: persisted_bookmark.id, url: 'http://www.bing.com', title: 'Bing')
      updated_bookmark = Bookmark.all[0]
      expect(updated_bookmark.id).to eq persisted_bookmark.id
      expect(updated_bookmark.url).to eq 'http://www.bing.com'
      expect(updated_bookmark.title).to eq 'Bing'
    end
    it 'updates the name and not the url when the url is empty' do
      Bookmark.create(url: 'http://www.google.com', title: 'Google')
      persisted_bookmark = Bookmark.all[0]
      Bookmark.update(id: persisted_bookmark.id, url: "", title: 'Bing')
      updated_bookmark = Bookmark.all[0]
      expect(updated_bookmark.id).to eq persisted_bookmark.id
      expect(updated_bookmark.url).to eq 'http://www.google.com'
      expect(updated_bookmark.title).to eq 'Bing'
    end
    it 'updates the url and not the name when the name is empty' do
      Bookmark.create(url: 'http://www.google.com', title: 'Google')
      persisted_bookmark = Bookmark.all[0]
      Bookmark.update(id: persisted_bookmark.id, url: "http://www.bing.com", title: '')
      updated_bookmark = Bookmark.all[0]
      expect(updated_bookmark.id).to eq persisted_bookmark.id
      expect(updated_bookmark.url).to eq 'http://www.bing.com'
      expect(updated_bookmark.title).to eq 'Google'
    end
  end
end
