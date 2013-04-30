require './store_config'
require 'benchmark'
require 'rspec/core/rake_task'

def run_performance_tests
  puts "Running the performance suite against #{ ENV['PERFORMANCE_TARGET'] }"
  time = Benchmark.measure do
    #Rake::Task['performance:actual_tests'].invoke
    1000.times{ 2*2 }
  end
  puts time
end

namespace :performance do
  desc "Run the performance suite locally"
  task :local => :environment do
    ENV['PERFORMANCE_TARGET'] = StoreConfig.development_url
    run_performance_tests
  end

  desc "Run the performance suite against production"
  task :production => :environment do
    ENV['PERFORMANCE_TARGET'] = StoreConfig.production_url
    run_performance_tests
  end
end