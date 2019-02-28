require 'sinatra/base'
require './lib/bookmark'

class Bookmarks < Sinatra::Base
  get '/' do
    "Bookmark Manager!"
  end

  get '/bookmarks' do
    ENV
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks/save_new' do
    Bookmark.add(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  post '/bookmarks/delete' do
    Bookmark.delete(bookmarks: params)
    redirect '/bookmarks'
  end

  post '/bookmarks/update' do
    p params
    # Bookmark.update(bookmark: params)
    # @bookmark = #thing returned from method
    erb :'bookmarks/update'
    #redirect('/bookmarks/update')
  end

  # get '/bookmarks/update' do
  #   Bookmark.update(bookmark: params)
  # end

  run! if app_file == $0
end
