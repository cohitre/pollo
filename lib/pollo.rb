require 'dm-core'
require 'dm-migrations'
require 'dm-validations'
require 'pollo/configuration'
require 'pollo/dsl'

model_dir = File.expand_path('../pollo/models', __FILE__)
Dir["#{model_dir}/*.rb"].each do |f|
  require "pollo/models/#{File.basename(f)}"
end

module Pollo
  extend self

  def configuration
    @configuration ||= Configuration.new
  end

  def configure
    yield configuration
    setup!
  end

  def define_poll(name, &block)
    DSL.new(name, &block).create!
  end

  private

    def setup!
      DataMapper.setup(:default, configuration.db_connection_string)
      DataMapper.auto_upgrade!
    end
end
