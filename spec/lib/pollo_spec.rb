require 'spec_helper'

module Pollo
  describe self do
    describe '.define_poll' do
      let(:poll) { Poll.first(:name => 'Monty Python') }
      let(:name_question) { poll.questions.find { |q| q.text =~ /name/ } }

      before(:each) do
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
      end

      it 'creates the poll' do
        Poll.all.map(&:name).should == ['Monty Python']
      end

      it 'creates the questions' do
        poll.questions.map(&:text).should == [
          'What is your name?',
          'What is your quest?'
        ]
      end

      it 'sets answer_required on the configured questions' do
        name_question.answer_required?.should be_true
      end

      it 'creates the possible answers' do
        name_question.possible_answers.map(&:text).should == [
          'Sir Launcelot',
          'King Arthur',
          'Monty Python'
        ]
      end
    end
  end
end
