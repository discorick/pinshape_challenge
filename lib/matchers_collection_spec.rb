describe MatchersCollection do
  context 'collects matchers and criteria using a default matching strategy' do

    module PinshapeChallenge
      class MockMatchers
        def self.match_some(criteria)
        end
      end
    end

    class MockObject
      def init
        class << self
          include MatchersCollection
        end
      end
    end

    let(:sut){ MockObject.new }
    let(:criteria){ ["SomeCriteria"] }

    before do
      sut.init
      sut.matching_strategy = MockMatchers
      sut.match_some(criteria)
    end

    it 'adds matchers to the collection' do
      expect(sut.matchers[:match_some][:criteria]).to eql(criteria)
      expect(sut.matchers[:match_some][:strategy]).to eql(MockMatchers)
    end
  end
end
