require 'sinatra'
require 'haml'
require 'bathroom'

get '/' do
  @occupied = Bathroom.occupied?
  haml :home
end
