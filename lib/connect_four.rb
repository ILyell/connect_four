require_relative "renderer"
require_relative "board"
require_relative "cell"
require "pry"

board = Board.new

board.welcome_message

board.populate_columns

board.render_board(board)
