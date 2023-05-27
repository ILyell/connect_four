
require_relative "board"
require_relative "cell"
require "pry"
require_relative 'renderer'
include Render
board = Board.new

board.welcome_message

board.populate_columns

render_board(board)

board.columns[:a][0].set_ply(:ply_1)

render_board(board)

board.add_piece(:ply_2, :b)
board.render_board(board)
board.add_piece(:ply_1, :b)
render_board(board)
board.add_piece(:ply_2, :b)
render_board(board)
board.add_piece(:ply_1, :b)
render_board(board)
board.add_piece(:ply_2, :d)
render_board(board)
board.add_piece(:ply_1, :e)
render_board(board)
board.add_piece(:ply_2, :g)
render_board(board)
board.add_piece(:ply_1, :b)
render_board(board)
board.add_piece(:ply_2, :a)
render_board(board)




