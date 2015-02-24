require 'net/http'
require 'json'
require_relative "./configuration"

class Bathroom
  SENSOR_NAME = "urn:micasaverde-com:serviceId:SecuritySensor1"
  TRIPPED = "Tripped"

  attr_reader :cache, :config, :logger

  def endpoint
    "http://#{config.sensor_host}/port_3480/data_request?id=lu_status&DataVersion=131172371"
  end

  def initialize(cache, config, logger)
    @cache = cache
    @config = config
    @logger = logger
  end

  def occupied?
    response = cache.fetch(:is_occupied, 1) do
      call_response = StatusApiCall.new(endpoint).perform
      logger.info "api responded with: #{call_response.inspect}"
      call_response
    end
    logger.info "cache responded with: #{response.inspect}"
    response
  end

  # Call the Bathroom API, then parse for occupied status.
  # @return [Boolean] Occupied - true or false
  class StatusApiCall
    def initialize(endpoint)
      @endpoint = endpoint
    end

    def perform
      uri = URI.parse(@endpoint)
      response = Net::HTTP.get_response(uri)

      json = JSON response.body

      devices_json = json['devices']

      device = devices_json.detect do |d|
        state = d["states"].first
        state["service"] == SENSOR_NAME
      end

      device["states"].any? do |st|
        st["variable"] == TRIPPED &&
          st["value"] == "0"
      end
    end
  end
end
