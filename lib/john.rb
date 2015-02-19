require 'sinatra'
require 'haml'
require_relative 'models/bathroom'

class John < Sinatra::Application
  configure do
    set :bind, '0.0.0.0'
    set :public_folder, File.expand_path("../../public", __FILE__)
  end

  get '/' do
    haml :home
  end

  get '/bathroom' do
    {occupied: Bathroom.occupied?}.to_json
  end
end
