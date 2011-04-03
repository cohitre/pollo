require 'rubygems'
require 'bundler'
Bundler.setup

$LOAD_PATH.unshift File.expand_path('../app', __FILE__)
require 'example'

use Rack::ShowExceptions

run ExampleApp.new

