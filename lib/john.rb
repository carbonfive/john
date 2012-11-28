$: << File.join(File.dirname(__FILE__), 'models')
require 'sinatra'
require 'haml'
require 'bathroom'
require_relative 'queue'

get '/' do
  @occupied = Bathroom.occupied?
  haml :home
end
