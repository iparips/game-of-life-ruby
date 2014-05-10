require 'matrix'
require 'parser'

describe Parser do

  describe "parsing a single cell" do

    it "parses an dead cell" do
      expect(Parser.parse('-').first.first.alive?).to be_false
    end

    it "parses a live cell" do
      expect(Parser.parse('*').first.first.alive?).to be_true
    end

  end

  describe "parsing multiple cells on a single line" do

    it "parses 3 cells with a mix of dead and alive ones" do
      cells = Parser.parse('-*-')
      expect(cells[0].map(&:alive?)).to match_array([false, true, false])
    end

  end

  describe "parsing multiple cells on a multiple line" do

    it "parses 2 lines of cells" do
      cells = Parser.parse("-*-\n---")
      expect(cells.flatten.map(&:alive?)).to match_array([false, true, false, false, false, false])
    end

  end

end
