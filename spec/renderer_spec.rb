require 'matrix'
require 'renderer'

describe Renderer do

  it "renders one dead cell" do
    expect(Renderer.render_single(Cell.new(false))).to eq('-')
  end

  it "renders one live cells" do
    expect(Renderer.render_single(Cell.new(true))).to eq('*')
  end

  it "renders a list of mixed cells" do
    cells = Matrix[[ Cell.new(true), Cell.new(false) ]]
    expect(Renderer.render(cells)).to eq("*-\n")
  end

  describe "rendering multiple lines" do

    it "renders a list of sells" do
      cells = Matrix[[ Cell.new(true), Cell.new(false) ], [ Cell.new(true), Cell.new(false) ]]
      result = Renderer.render(cells)
      expect(result).to eq("*-\n*-\n")
    end

  end

end
