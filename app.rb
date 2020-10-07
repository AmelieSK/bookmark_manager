# loading sinatra
require 'sinatra'
require './lib/bookmark'

# class for managing bookmarks
class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end
end
