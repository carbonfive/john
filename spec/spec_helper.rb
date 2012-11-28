require 'john'
require 'rack/test'

set :environment, :test

module SinatraRSpecHelpers
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

RSpec.configure do |config|
  config.include SinatraRSpecHelpers
end
