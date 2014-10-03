describe 'Pinshape Challenge' do
  context 'when stripping out text following a set of comment markers' do
    
    let(:text) { "apples, pears # and bananas\ngrapes\nbananas !apples" }
    let(:markers) { ["#", "!"] }
    let(:result) { "apples, pears\ngrapes\nbananas" }

    def solution(text, markers)
      StringLineIterator.using(text) do |line|
        line.following(markers).slice
      end
    end

    it "each line should be stripped of any text following the markers, including the markers" do
      expect(solution(text, markers)).to eq(result)
    end
  end
end
