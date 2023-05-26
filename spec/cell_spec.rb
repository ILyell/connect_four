require 'spec_helper'

RSpec.describe Cell do
    before(:each) do

        @cell_1 = Cell.new
        @cell_2 = Cell.new
    end
    
    describe '#initialize' do
        it 'exist' do
            
            expect(@cell_1).to be_a(Cell)
            expect(@cell_2).to be_a(Cell)

        end

        it 'starts with 1 attribute(@status) with a value of :empty' do

            expect(@cell_1.status).to eq(:empty)
            expect(@cell_2.status).to eq(:empty)

        end
    end

    describe 'reader methods for getting a boolean from @status' do
        it '#empty?' do

            expect(@cell_1.empty?).to eq(true)
            expect(@cell_2.empty?).to eq(true)

        end

        it '#ply_1?' do
            
            expect(@cell_1.ply_1?).to eq(false)
            expect(@cell_2.ply_1?).to eq(false)

        end

        it '#ply_2?' do 
            
            expect(@cell_2.ply_2?).to eq(false)
            expect(@cell_2.ply_2?).to eq(false)

        end
    end
end