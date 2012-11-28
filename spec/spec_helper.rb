require 'john'
require 'rack/test'
require 'faker'

set :environment, :test

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|file| require file}

module SinatraRSpecHelpers
  def app
    Sinatra::Application
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include SinatraRSpecHelpers
end
