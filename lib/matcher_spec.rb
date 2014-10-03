describe Matcher do
  context "returns the results of string matches" do
    context "matches anything following the provided criteria, including the criteria" do

      let(:sut) { Matcher }
      let(:string) { "A String To Match #12 !34 56"}
      let(:result) { "A String To Match " }
      let(:criteria) { ["#", "!"] }

      it "should select a match based on the criteria, if there are multiple matches, the match of least length will be used" do
        expect(sut.following(string, criteria)).to eq(result)
      end
    end
  end
end
