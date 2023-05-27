require 'spec_helper'
include Render

RSpec.describe Render do
    describe "#render cell" do
        it 'outputs an empty cell character' do

            cell_1 = Cell.new
            cell_2 = Cell.new

            expect(render_cell(cell_1)).to eq("*")
            expect(render_cell(cell_2)).to eq("*")

        end

        it 'outputs a cell with ply_1 attribute' do

            cell_1 = Cell.new
            cell_2 = Cell.new
            cell_1.set_ply(:ply_1)
            cell_2.set_ply(:ply_1)

            expect(render_cell(cell_1)).to eq("X")
            expect(render_cell(cell_2)).to eq("X")
        end
        it 'outputs a cell with ply_1 attribute' do

            cell_1 = Cell.new
            cell_2 = Cell.new
            cell_1.set_ply(:ply_2)
            cell_2.set_ply(:ply_2)

            expect(render_cell(cell_1)).to eq("O")
            expect(render_cell(cell_2)).to eq("O")
        end

    end

end