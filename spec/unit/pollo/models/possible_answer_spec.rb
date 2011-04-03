require 'spec_helper'

module Pollo
  describe PossibleAnswer do
    def new_valid_record
      described_class.new \
        :text => 'Lemur'
    end

    it_validates "presence of", :text
  end
end
