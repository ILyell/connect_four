require 'spec_helper'

include GameStart

RSpec.describe GameStart do
    describe '#game_start' do
        it 'prints a welcome message to the terminal' do
            expect{game_start}.to output("\nWelcome to CONNECT 4\n\nEnter P to play or Q to quit!\n").to_stdout
        end
    end

    describe '#start' do
        it 'gets an input from the user' do
            allow($stdin).to receive(:gets).and_return('p')

            input = $stdin.gets

            expect(input).to eq('p')
        end

        it 'returns true if a user enters P or p 'do
            allow($stdin).to receive(:gets).and_return('p')
            input = $stdin.gets
            # allow($stdin).to receive(:gets).and_return('P')

            expect(start).to receive(input).and_return(true)

        end

        it 'exits if Q or q is pressed' do
            allow($stdin).to receive(:gets).and_return('q')
            
        end
    end
end