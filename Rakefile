require 'rspec/core/rake_task'
require_relative './jmeter/server_performance_test'
RSpec::Core::RakeTask.new :spec

task default: :spec

namespace :performance do
  desc "Test server performance with jmeter"
  task :test do
    ServerPerformanceTest.perform
  end
end
