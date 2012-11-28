require 'john'
require 'rack/test'
require 'webrat'
require 'vcr'

set :environment, :test

module SinatraRSpecHelpers
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

RSpec.configure do |config|
  config.include SinatraRSpecHelpers
  config.include Webrat::Matchers
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
