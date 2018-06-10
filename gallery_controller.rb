require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/artist')
require_relative('./models/artwork')
also_reload('./models/*')

get '/gallery' do
  erb(:home)
end

get '/gallery/artists' do
  @artists = Artist.all()
  erb(:artists)
end

get '/gallery/collections' do
  erb(:collections)
end

get '/gallery/artworks' do
  @artworks = Artwork.all()
  erb(:artworks)
end

get '/gallery/new_artist' do
  erb(:new_artist)
end

post '/gallery/artists' do
  Artist.new(params).save()
  redirect to '/gallery/artists'
end

get '/gallery/new_artwork' do
  erb(:new_artwork)
end

post '/gallery/artworks' do
  Artwork.new(params).save()
  redirect to '/gallery/artworks'
end

post '/gallery/artists/:id/delete' do
  artist = Artist.find(params['id'])
  artist.delete()
  redirect to '/gallery/artists'
end
