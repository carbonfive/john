require 'sinatra'
require 'haml'

get '/' do
  haml :home
end
