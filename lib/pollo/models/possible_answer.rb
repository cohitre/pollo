class PossibleAnswer
  include DataMapper::Resource

  property :id, Serial
  property :text, String, :required => true
  property :question_id, Integer
end
