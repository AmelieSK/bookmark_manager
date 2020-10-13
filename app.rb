# loading sinatra
require 'sinatra'
require './lib/bookmark'
require 'pry'

# class for managing bookmarks
class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/new-bookmark' do
    erb :'bookmarks/new'
  end
end
