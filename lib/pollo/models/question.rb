module Pollo
  class Question
    include DataMapper::Resource

    property :id, Serial
    property :text, String, :required => true
    property :answer_required, Boolean, :required => true, :default => false
  end
end

