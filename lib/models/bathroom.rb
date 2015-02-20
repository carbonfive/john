require 'net/http'
require 'json'

class Bathroom
  ENDPOINT = 'http://192.168.7.40/port_3480/data_request?id=lu_status&DataVersion=131172371'
  SENSOR_NAME = "urn:micasaverde-com:serviceId:SecuritySensor1"
  TRIPPED = "Tripped"

  attr_reader :cache

  def initialize(cache=NullCache.new)
    @cache = cache
  end

  def occupied?
    cache.fetch(:is_occupied, 1) do
      StatusApiCall.new.perform
    end
  end

  class NullCache
    def fetch(key, ttl)
      yield
    end
  end

  # Call the Bathroom API, then parse for occupied status.
  # @return [Boolean] Occupied - true or false
  class StatusApiCall
    def perform
      uri = URI.parse(ENDPOINT)
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
