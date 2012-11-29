require 'net/http'
require 'json'

class Bathroom
  def self.to_json
    uri = URI.parse 'http://192.168.7.40/port_3480/data_request?id=lu_status'
    response = Net::HTTP.get_response uri
    json = JSON response.body
    sensor = json['devices'].detect do |device|
      device['id'] == 3
    end
    state = sensor['states'].detect do |state|
      state['variable'] == 'Tripped'
    end
    { occupied: state['value'] == '0' }.to_json
  end
end
