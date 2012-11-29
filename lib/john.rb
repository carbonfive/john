require 'sinatra'
require 'haml'
require_relative 'models/bathroom'
require_relative 'queue'

get '/' do
  haml :home
end

get '/bathroom' do
  {occupied: Bathroom.occupied?}.to_json
end
