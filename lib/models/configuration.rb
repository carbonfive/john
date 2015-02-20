require "yaml"
require "ostruct"

class Configuration < Struct.new(:host, :port, :sensor_host)
  def self.bootstrap
    config = YAML.load_file(File.expand_path("../../../config/app.yml", __FILE__))

    new(config["host"], config["port"], config["sensor_host"])
  end
end
