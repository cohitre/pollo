require 'spec_helper'
require 'capybara/rspec'
require './app/example'

describe ExampleApp, :type => :acceptance do
  Capybara.app = described_class

  describe 'GET /' do
    before(:each) { visit '/' }

    it 'renders the poll form' do
      within('form') do
        all('legend').map(&:text).should == [
          'What is your name?',
          'What is your quest?'
        ]
      end
    end
  end
end
