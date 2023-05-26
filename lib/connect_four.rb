require_relative "renderer"
require_relative "board"
require_relative "cell"
require "pry"

board = Board.new

board.welcome_message

board.populate_columns

board.render_board(board)

board.columns[:a][0].set_ply_1

board.render_board(board)
