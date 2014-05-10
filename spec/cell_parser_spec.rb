require 'matrix'
require 'cell_parser'

describe "CellParser" do

  describe "string to cells" do

    describe "parsing a single cell" do

      it "parses an dead cell" do
        expect(CellParser.parse('-').first.alive?).to be_false
      end

      it "parses a live cell" do
        expect(CellParser.parse('*').first.alive?).to be_true
      end

    end

    describe "parsing multiple cells on a single line" do

      #TODO: start here, changing CellParser to return a Matrix instead of an Array
      it "parses 3 cells with a mix of dead and alive ones" do
        cells = CellParser.parse('-*-')
        expect(cells.row(0).to_a.map(&:alive?)).to match_array([false, true, false])
      end

    end

    describe "parsing multiple cells on a multiple line" do

      it "parses 2 lines of cells" do
        cells = CellParser.parse("-*-\n---")
        expect(cells.to_a.flatten.map(&:alive?)).to match_array([false, true, false, false, false, false])
      end

    end

  end

  describe "cells to string" do

    it "renders one dead cell" do
      expect(CellParser.render_single(Cell.new(false))).to eq('-')
    end

    it "renders one live cells" do
      expect(CellParser.render_single(Cell.new(true))).to eq('*')
    end

    it "renders a list of mixed cells" do
      cells = Matrix[[ Cell.new(true), Cell.new(false) ]]
      expect(CellParser.render(cells)).to eq("*-\n")
    end

    describe "rendering multiple lines" do

      it "renders a list of sells" do
        cells = Matrix[[ Cell.new(true), Cell.new(false) ], [ Cell.new(true), Cell.new(false) ]]
        result = CellParser.render(cells)
        expect(result).to eq("*-\n*-\n")
      end

    end

  end

end
