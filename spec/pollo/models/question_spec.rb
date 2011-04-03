require 'spec_helper'

module Pollo
  describe Question do
    def new_valid_record
      described_class.new \
        :text => 'What is your favorite animal?',
        :answer_required => false
    end

    it_validates "presence of", :text
    it_validates "presence of", :answer_required
    it_defaults  "value of",    :answer_required, :to => false
  end
end
