module Pollo
  class Poll
    include DataMapper::Resource

    property :id, Serial
    property :name, String, :required => true

    has n, :questions
  end
end
