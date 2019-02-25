require 'sinatra/base'
require './lib/bookmark'

class Bookmarks < Sinatra::Base
  get '/' do
    "Bookmark Manager!"
  end

  get '/bookmarks' do
    @bookmarks = [
      "http://www.makersacademy.com",
      "http://www.github.com",
      "http://www.google.com"
  ]

    erb :'bookmarks/index'
  end







  # start the server if ruby file executed directly
  run! if app_file == $0
end
