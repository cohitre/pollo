require 'rubygems'
require 'bundler'
Bundler.setup

require 'rspec'
Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.color_enabled = true
  config.debug = true

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.alias_it_should_behave_like_to :it_validates, "it validates"
  config.alias_it_should_behave_like_to :it_defaults, "it defaults"
end

require 'pollo'

Pollo.configure do |config|
  config.db_connection_string = 'sqlite::memory:'
end
