# loading sinatra
require 'sinatra'
require './lib/bookmark'

# class for managing bookmarks
class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    erb :'bookmarks/index', :locals => { :bookmarks => Bookmark.all }
  end
end
