require 'dead_or_alive'

describe DeadOrAlive do

	context "alive cell" do
		let(:cell) { true }
		let(:lonely) { 1 }
		let(:social) { 3 }

		it "kills lonely cell" do
			expect(subject.decide(cell, lonely)).to eq(false)
		end

		it "keeps alive a social cell" do
			expect(subject.decide(cell, social)).to eq(true)
		end

	end

	
	
end