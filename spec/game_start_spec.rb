require 'spec_helper'

include GameStart

RSpec.describe GameStart do
    describe '#game_start' do
        it 'prints a welcome message to the terminal' do
            expect{game_start_message}.to output("\nWelcome to CONNECT 4\n\nEnter P to play or Q to quit!\n").to_stdout
        end
    end

    describe '#start' do
        it 'returns true if a user enters P or p' do
            
            # :msg = 'p'
            # binding.pry
            allow($stdin).to receive(:gets).and_return('p')
            # start
            expect(start).to receive($stdin.gets).and_return(true)
            # expect(GameStart).to receive(:game_start_message).and_return(true) 
        
        end

        xit 'exits if Q or q is pressed' do
            allow($stdin).to receive(:gets).and_return('q')
            $stdin.gets
            # start
            expect{start}.to eq(exit)
        end

        xit 'gives an error message with an invalid input' do
            
            allow($stdin).to receive(:gets).and_return('z')
            $stdin.gets
            # start
            # expect{start}.to output("Please enter a valid option\nPlease enter a valid option\nPleasexenter a valid option\n").to_stdout

        end
    end
end