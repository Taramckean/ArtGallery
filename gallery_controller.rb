require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('controllers/artist_controller')
require_relative('controllers/artwork_controller')


get '/gallery' do
  erb(:home)
end
