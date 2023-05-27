require_relative "board.rb"
require_relative "cell.rb"
require_relative "renderer.rb"
require_relative "turn.rb"
require "pry"

include Render

board = Board.new

board.welcome_message

board.populate_columns

render_board(board)

turn = Turn.new(:ply_1, board)
turn.prompt_user
turn = Turn.new(:ply_2, board)
turn.prompt_user
turn = Turn.new(:ply_1, board)
turn.prompt_user
turn = Turn.new(:ply_2, board)
turn.prompt_user
turn = Turn.new(:ply_1, board)
turn.prompt_user
turn = Turn.new(:ply_2, board)
turn.prompt_user
turn = Turn.new(:ply_1, board)
turn.prompt_user
turn = Turn.new(:ply_2, board)
turn.prompt_user
turn = Turn.new(:ply_1, board)
turn.prompt_user
turn = Turn.new(:ply_2, board)
turn.prompt_user
turn = Turn.new(:ply_1, board)
turn.prompt_user
turn = Turn.new(:ply_2, board)
turn.prompt_user
turn = Turn.new(:ply_1, board)
turn.prompt_user
turn = Turn.new(:ply_2, board)
turn.prompt_user
turn = Turn.new(:ply_1, board)
turn.prompt_user
turn = Turn.new(:ply_2, board)
turn.prompt_user
turn = Turn.new(:ply_1, board)
turn.prompt_user
turn = Turn.new(:ply_2, board)
turn.prompt_user
turn = Turn.new(:ply_1, board)
turn.prompt_user
turn = Turn.new(:ply_2, board)
turn.prompt_user




# board.columns[:a][0].set_ply(:ply_1)

# render_board(board)

# board.add_piece(:ply_2, :b)
# board.render_board(board)
# board.add_piece(:ply_1, :b)
# render_board(board)
# board.add_piece(:ply_2, :b)
# render_board(board)
# board.add_piece(:ply_1, :b)
# render_board(board)
# board.add_piece(:ply_2, :d)
# render_board(board)
# board.add_piece(:ply_1, :e)
# render_board(board)
# board.add_piece(:ply_2, :g)
# render_board(board)
# board.add_piece(:ply_1, :b)
# render_board(board)
# board.add_piece(:ply_2, :a)
# render_board(board)




