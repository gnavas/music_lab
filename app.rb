require 'sinatra'
require 'better_errors'
require 'sinatra/reloader'
require 'pry'
require "sinatra/activerecord"
require 'pg'
require './models/artist'


configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

#redirect to artists
get '/' do
redirect '/artists'
end
#reads all artists
get '/artists' do
 @artists = Artists.all
  erb :index
end
# render a form to create a new artists
get '/artists/new' do
  erb :new
end
# - reads a single artists
get '/artists/:id' do
@artist = Artists.find_by(id: params[:id])
erb :show
end
# render a form to edit an artist
get '/artists/:id/edit' do
  @artist = Artists.find_by(id: params[:id])
  erb :edit
end

post '/artists/new' do
  Artists.create(name: params[:name]) 
  redirect '/'
end

put '/artists/:id' do
  artist = Artists.find_by(id: params[:id])
  artist.update(name: params[:name])
  redirect '/artists'
  end

 delete '/artists/:id/delete' do
  artist = Artists.find_by(id: params[:id])
  artist.destroy
  redirect '/artists'
  end 


