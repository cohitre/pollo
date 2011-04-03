shared_examples_for "presence of" do |property|
  it "requires a value for #{property}" do
    record = new_valid_record
    record.send(:"#{property}=", nil)
    record.should_not be_valid
    record.errors[property.to_sym].first.should =~ /must not be (nil|blank)/
  end
end

shared_examples_for "value of" do |property, options|
  value = options[:to]

  it "defaults value of #{property} to #{value}" do
    record = described_class.new
    record.send(property).should == value
  end
end

