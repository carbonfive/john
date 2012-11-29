require 'sinatra'
require 'haml'
require_relative 'models/bathroom'
require_relative 'queue'

get '/' do
  haml :home
end

get '/bathroom' do
  Bathroom.to_json
end
