require 'net/http'
require 'json'

class Bathroom
  def self.occupied?
    uri = URI.parse 'http://192.168.7.40/port_3480/data_request?id=lu_status&DataVersion=131172371'
    response = Net::HTTP.get_response(uri)

    json = JSON response.body
    json['devices'][0]['states'][0]['value'] == '0'
  end
end
