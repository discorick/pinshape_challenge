describe StringLine do

  module PinshapeChallenge
    class MockMatchers
      def self.following(string, criteria)
      end
    end
  end

  context 'an object that represents a one line string' do

    let(:string) { "single line !string" }
    let(:sut) { StringLine.new(string) }

    context 'slices matchers based on matchers in the collection' do

      let(:criteria){ ['!', '#'] }

      before :each do
        sut.matching_strategy = MockMatchers
        MockMatchers.should_receive(:following) do |arg1, arg2|
          expect(arg1).to eql(string)
          expect(arg2).to eql(criteria)
          "single line"
        end
      end

      it 'slices the line based on the match' do
        sut.following(criteria).slice
        expect(sut.instance_variable_get(:@line)).to eq("single line")
      end
    end
  end
end
