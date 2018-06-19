require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('../models/artist')
also_reload('../models/*')


get '/gallery/artists' do
  @artists = Artist.all()
  erb(:"artists")
end

get '/gallery/collections' do
@artists = Artist.all()
  erb(:"collections")
end

get '/gallery/new_artist' do
  erb(:"new_artist")
end

post '/gallery/artists' do
  Artist.new(params).save()
  redirect to '/gallery/artists'
end

get '/gallery/artists/:id' do
  @artists = Artist.find(params[:id])
  erb(:"view_artist")
end

post '/gallery/artists/:id/delete' do
  Artist.delete(params[:id])
  redirect to '/gallery/artists'
end
