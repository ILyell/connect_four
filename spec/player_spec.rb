require 'spec_helper'

RSpec.describe Player do
    
    before(:each) do

        @player_1 = Player.new("Tim", :ply_1)
        @player_2 = Player.new("CPU", :ply_2, true)
    end


    describe '#initialize' do

        it 'takes 3 arguments, one is set default false' do
            
            expect(@player_1).to be_a(Player)
            expect(@player_2).to be_a(Player)

        end

        it 'holds a name, player symbol and is_cpu boolean' do

            expect(@player_1.name).to eq("Tim")
            expect(@player_1.player).to eq(:ply_1)
            expect(@player_1.is_cpu?).to eq(false)
            expect(@player_2.name).to eq("CPU")
            expect(@player_2.player).to eq(:ply_2)
            expect(@player_2.is_cpu?).to eq(true)

        end
    end

    describe '#is_cpu?' do

        it 'returns a boolean from @is_cpu' do
            
            expect(@player_1.is_cpu?).to eq(false)
            expect(@player_2.is_cpu?).to eq(true)

        end
    end
end