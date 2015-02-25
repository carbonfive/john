require "yaml"
require "ostruct"

class Configuration < Struct.new(:host, :port, :sensor_host)
  def self.bootstrap
    config = YAML.load_file(File.expand_path("../../../config/app.yml", __FILE__))

    environment = ENV['RACK_ENV'] || 'development'
    settings = config[environment]

    new(settings["host"], settings["port"], settings["sensor_host"])
  end
end
