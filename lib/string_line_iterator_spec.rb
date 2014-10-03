describe StringLineIterator do

  class MockLine
    def initialize(text)
      return text
    end
  end

  context 'iterating over the lines in a string' do

    let(:sut) { StringLineIterator }
    let(:text) { "sample multilined\nstring\nwith words"}

    before :each do
      StringLineIterator.line_object = MockLine

      MockLine.should_receive(:new).with(an_instance_of(String)).exactly(3).times do |string|
        string
      end
    end

    it 'yields each line as an object from the selected string' do
      sut.using(text){|line_obj| line_obj } 
    end
      
  end
end
