require './store_config'
require 'benchmark'

def setup_database
  puts "Copying the development database to the test database"
  `cp db/monster_demo db/monster_test`
end

def run_performance_tests
  require 'rspec'

  puts "Running the performance suite against #{ ENV['PERFORMANCE_ROOT'] }"
  time = Benchmark.measure do
    RSpec::Core::Runner.disable_autorun!
    RSpec::Core::Runner.run(['spec/performance/products_performance_spec.rb'])    
  end
  real_time = time.to_s.scan(/\((.*)\)/).first.first.to_f
  puts ""
  puts "Suite executed in #{real_time} seconds"
end

namespace :performance do
  desc "Run the performance suite locally"
  task :local => :environment do
    setup_database
    ENV['PERFORMANCE_ROOT'] = StoreConfig.development_url
    run_performance_tests
  end

  desc "Run the performance suite against production"
  task :production => :environment do
    require 'capybara/poltergeist'
    Capybara.current_driver = :poltergeist
    ENV['PERFORMANCE_ROOT'] = StoreConfig.production_url
    run_performance_tests
  end
end