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
end