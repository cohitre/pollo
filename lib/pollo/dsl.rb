module Pollo
  class DSL
    attr_reader :poll
    def initialize(poll_name, &block)
      @poll = Poll.new(:name => poll_name)
      @block = block
    end

    def create!
      instance_eval(&@block)
      poll.save!
    end

    def question(*args, &block)
      q = Question.new(*args, &block)
      q.create!
      poll.questions << q.record
    end

    class Question
      attr_reader :record
      def initialize(text, options = {}, &block)
        @record = Pollo::Question.new(options.merge(:text => text))
        @block = block
      end

      def create!
        instance_eval(&@block)
      end

      def answer(text)
        a = PossibleAnswer.new(:text => text)
        record.possible_answers << a
      end
    end
  end
end
