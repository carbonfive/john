require 'sinatra'
require 'haml'
require 'cache'
require 'redis'
require_relative 'models/bathroom'

class John < Sinatra::Application
  configure do
    enable :logging
    set :bind, '0.0.0.0'
    set :public_folder, File.expand_path("../../public", __FILE__)
    file = File.new(File.expand_path("../../log/#{settings.environment}.log", __FILE__), 'a+')
    file.sync = true
    use Rack::CommonLogger, file
  end

  get '/' do
    haml :home
  end

  get '/bathroom' do
    {occupied: bathroom.occupied?}.to_json
  end

  private

  def cache
    @cache ||= Cache.wrap(Redis.new)
  end

  def bathroom
    @bathroom ||= Bathroom.new(cache, config, logger)
  end

  def config
    @config ||= Configuration.bootstrap
  end
end
