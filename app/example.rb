require 'sinatra'
require 'pollo'

dir = File.expand_path('..', __FILE__)

Pollo.configure do |config|
  config.db_connection_string = "sqlite://#{dir}/db/development.db"
end

Pollo.define_poll 'Monty Python' do
  question 'What is your name?', :answer_required => true do
    answer 'Sir Launcelot'
    answer 'King Arthur'
    answer 'Monty Python'
  end

  question 'What is your quest?' do
    answer 'To find the holy grail.'
    answer 'To build a cool polling gem.'
  end
end

class ExampleApp < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/views'
  set :raise_errors, true
  set :show_exceptions, false

  get '/' do
    @poll = Pollo::Poll.first
    erb :form
  end
end
