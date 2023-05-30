require 'spec_helper'
include Render

RSpec.describe Render do
    describe 'welcome_message' do
        it 'outputs the welcome message to terminal' do
            expect{welcome_message}.to output("\nWelcome to CONNECT 4\n\nEnter P to play or Q to quit!\n").to_stdout
        end
    end

    describe '#error_message' do
        it 'prints an error_message given the type input and the input key if avalible' do
            
            expect{error_message(:invalid_column, 'z')}.to output("z is an invalid column").to_stdout
            expect{error_message(:invalid_column, 'x')}.to output("x is an invalid column").to_stdout
            expect{error_message(:full_column, 'a')}.to output("a column is full!").to_stdout
            expect{error_message(:full_column, 'b')}.to output("b column is full!").to_stdout
            expect{error_message(:invalid_option, 'x')}.to output("Please enter a valid option\n").to_stdout

        end
    end

    describe 'render_board' do 
        xit 'renders a given board' do 
            board = Board.new
            board.populate_columns
            expect{render_board(board)}.to output("\n    A B C D E F G\n\n    * * * * * * *\n    * * * * * * *\n    * * * * * * *\n    * * * * * * *\n    * * * * * * *\n    * * * * * * *\n").to_stdout
            
            board.columns[:a][0].set_ply(:ply_1)
            board.columns[:a][1].set_ply(:ply_1)
            board.columns[:a][2].set_ply(:ply_1)
            expect{render_board(board)}.to output("\n    A B C D E F G\n\n    * * * * * * *\n    * * * * * * *\n    * * * * * * *\n    X * * * * * *\n    X * * * * * *\n    X * * * * * *\n").to_stdout
            
            board.columns[:b][0].set_ply(:ply_2)
            board.columns[:c][0].set_ply(:ply_2)
            board.columns[:a][3].set_ply(:ply_2)
            expect{render_board(board)}.to output("\n    A B C D E F G\n\n    * * * * * * *\n    * * * * * * *\n    O * * * * * *\n    X * * * * * *\n    X * * * * * *\n    X O O * * * *\n").to_stdout

        end
    end
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

    describe 'turn_instruction' do
        it 'outputs instuctions to the terminal' do
            
            expect{turn_instruction}.to output("\nChoose a column A-G, or type 'quit' to quit.\n\n").to_stdout

        end
    end

    describe "#render_falling_piece" do
        it 'renders a falling peice' do
            @board_1 = Board.new
            @board_1.populate_columns
            @board_1.add_piece(:ply_1, :b)
    
            render_falling_piece(@board_1)
        end
    end
end