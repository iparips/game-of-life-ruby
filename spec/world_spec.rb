require 'rspec'
require_relative '../lib/world'

describe World do
	
	let(:first_gen_cell) { double("first gen cell") }
	let(:second_gen_cell) { double("second gen cell") }

	let(:first_iteration) { 
		[[ first_gen_cell ]]
	}

	let(:second_iteration) { 
		[[ second_gen_cell ]] 
	}

	let(:neighbours_count) { 5 }
	let(:neighbours_counter) { double('counter') }
	let(:dead_or_alive) { double('dead or alive') }

	subject { World.new first_iteration, neighbours_counter, dead_or_alive }

	before do
		allow(neighbours_counter).to receive(:count).and_return(neighbours_count)
		allow(dead_or_alive).to receive(:decide).and_return(second_gen_cell)
	end

	it 'should generate next iteration' do
		expect(subject.next_iteration).to eq second_iteration
	end

	it 'calls neighbours_counter' do
		subject.next_iteration
		expect(neighbours_counter).to have_received(:count).with(first_gen_cell)
	end

	it 'calls dead_or_alive' do
		subject.next_iteration
		expect(dead_or_alive).to have_received(:decide).with(first_gen_cell, neighbours_count)
	end

end