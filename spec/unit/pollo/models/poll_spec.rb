require 'spec_helper'

module Pollo
  describe Poll do
    def new_valid_record
      described_class.new \
        :name => 'Favorite Animals'
    end

    it_validates "presence of", :name
  end
end
