require './store_config'
require 'benchmark'

def setup_database
  puts "Copying the development database to the test database"
  `cp db/monster_demo db/monster_test`
end

def run_performance_tests
  require 'rspec'
  setup_database
  puts "Running the performance suite against #{ ENV['PERFORMANCE_TARGET'] }"
  time = Benchmark.measure do
    RSpec::Core::Runner.disable_autorun!
    RSpec::Core::Runner.run(['spec/performance/products_performance_spec.rb'])    
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