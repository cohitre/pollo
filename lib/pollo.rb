require 'dm-core'
require 'dm-migrations'
require 'dm-validations'
require 'pollo/configuration'

module Pollo
  extend self

  def configuration
    @configuration ||= Configuration.new
  end

  def configure
    yield configuration
    setup!
  end

  private

    def setup!
      DataMapper.setup(:default, configuration.db_connection_string)
      require_all_models
      DataMapper.auto_upgrade!
    end

    def require_all_models
      model_dir = File.expand_path('../pollo/models', __FILE__)
      Dir["#{model_dir}/*.rb"].each do |f|
        require "pollo/models/#{File.basename(f)}"
      end
    end
end
