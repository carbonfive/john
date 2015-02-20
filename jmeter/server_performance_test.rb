require 'ruby-jmeter'
require_relative "../lib/models/configuration"

class ServerPerformanceTest
  def self.perform
    config = Configuration.bootstrap

    test do
      threads count: 5, loops: 10 do
        visit name: 'Bathroom API', url: "http://#{config.host}:#{config.port}/bathroom"
      end
    end.run(
      debug: true,
      log: 'jmeter/jmeter.log',
      jtl: 'jmeter/results.jtl',
      file: "jmeter/jmeter.jmx"
    )
  end
end
