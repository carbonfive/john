require 'sinatra'
require 'haml'
require_relative 'models/bathroom'
require_relative 'queue'

set :bind, '0.0.0.0'

get '/' do
  haml :home
end

get '/bathroom' do
  {occupied: Bathroom.occupied?}.to_json
end
