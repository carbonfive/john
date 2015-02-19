require 'ruby-jmeter'

class ServerPerformanceTest
  def self.perform
    host = "192.168.7.5"
    port = "9393"
    test do
      threads count: 5, loops: 10 do
        visit name: 'Bathroom API', url: "http://#{host}:#{port}/bathroom"
      end
    end.run(
      debug: true,
      log: 'jmeter/jmeter.log',
      jtl: 'jmeter/results.jtl',
      file: "jmeter/jmeter.jmx"
    )
  end
end
