require 'neighbours_calc'
require 'matrix'

describe NeighboursCalc do

  it "counts" do
    cells = Matrix[
                   ['-','-'],
                   ['-','-']
                 ]

    expect(NeighboursCalc.calc(cells, 0, 0)).to eq(0)
  end

end
