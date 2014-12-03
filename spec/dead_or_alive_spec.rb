require 'dead_or_alive'

describe DeadOrAlive do

	context "alive cell" do

		let(:cell) { true }

		[
			{ neighbours: 1, lives: false },
			{ neighbours: 2, lives: true },
			{ neighbours: 3, lives: true },
			{ neighbours: 4, lives: false }
		]
		.each do |rule|

			neighbours = rule[:neighbours]
			lives = rule[:lives]

			context "#{neighbours} neighbours" do

				it "#{lives ? 'lives' : 'dies'}" do
					expect(subject.lives?(cell, neighbours)).to eq(lives)
				end

			end

		end

	end

	context 'dead cell' do

		let(:cell) { false }

		[
			{ neighbours: 1, lives: false },
			{ neighbours: 2, lives: false },
			{ neighbours: 3, lives: true },
			{ neighbours: 4, lives: false }
		]
		.each do |rule|

			neighbours = rule[:neighbours]
			lives = rule[:lives]

			context "#{neighbours} neighbours" do

				it "#{lives ? 'lives' : 'dies'}" do
					expect(subject.lives?(cell, neighbours)).to eq(lives)
				end

			end

		end

	end

end
