require( 'sinatra' )
require( 'sinatra/contrib/all') if development?
require_relative('controllers/artist_controller')
require_relative('controllers/artwork_controller')


get '/gallery' do
  erb(:home)
end
