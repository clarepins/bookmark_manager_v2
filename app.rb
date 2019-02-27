require 'sinatra/base'
require './lib/bookmark'

class Bookmarks < Sinatra::Base
  get '/' do
    "Bookmark Manager!"
  end

  get '/bookmarks' do
    p ENV
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.add(params[:add_bookmark])
    @bookmarks = Bookmark.all
    p "New bookmark added!"
    erb :'bookmarks/index'
  end

  # post '/add_bookmark' do
  #   Bookmark.add(params[:add_bookmark])
  #   redirect '/bookmarks'
  # end


  run! if app_file == $0
end

# adding comment to commit
