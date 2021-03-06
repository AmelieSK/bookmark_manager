require 'sinatra'
require './lib/bookmark'
require './lib/database_connection'

# class for managing bookmarks
class BookmarkManager < Sinatra::Base
  set(:method_override, true)

  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('bookmark_manager_test')
  else
    DatabaseConnection.setup('bookmark_manager')
  end

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

  delete '/bookmarks' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/new-bookmark' do
    erb :'bookmarks/new'
  end

  get '/bookmarks/:id/edit' do
    @id = params[:id]
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect "/bookmarks"
  end
end
