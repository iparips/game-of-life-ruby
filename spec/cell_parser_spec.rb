require 'cell_parser'

describe "GameParser" do

  describe "parsing a single cell" do

    it "parses an dead cell" do
      expect(CellParser.parse('-').first.alive?).to be_false
    end

    it "parses a live cell" do
      expect(CellParser.parse('*').first.alive?).to be_true
    end

  end

end
