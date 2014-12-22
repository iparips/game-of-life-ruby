require_relative '../spec_helper'

describe Grid do

	let(:first_gen_cell) { double("first gen cell") }
	let(:second_gen_cell) { double("second gen cell") }

	let(:initial_grid) {
		[[ first_gen_cell ]]
	}

	let(:second_iteration) {
		[[ second_gen_cell ]]
	}

	let(:neighbours_count) { 5 }
	let(:neighbours_counter) { double('counter') }
	let(:dead_or_alive) { double('dead or alive') }

	subject { Grid.new neighbours_counter, dead_or_alive }

	before do
		allow(neighbours_counter).to receive(:count).and_return(neighbours_count)
		allow(dead_or_alive).to receive(:lives?).and_return(second_gen_cell)
	end

	it 'should generate next iteration' do
		expect(subject.next_iteration(initial_grid)).to eq second_iteration
	end

	it 'calls neighbours_counter' do
		subject.next_iteration(initial_grid)
		expect(neighbours_counter).to have_received(:count).with(0,0,initial_grid)
	end

	it 'calls dead_or_alive' do
		subject.next_iteration(initial_grid)
		expect(dead_or_alive).to have_received(:lives?).with(first_gen_cell, neighbours_count)
	end

end
