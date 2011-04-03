module Pollo
  class Question
    include DataMapper::Resource

    property :id, Serial
    property :poll_id, Integer
    property :text, String, :required => true
    property :answer_required, Boolean, :required => true, :default => false

    has n, :possible_answers
  end
end

