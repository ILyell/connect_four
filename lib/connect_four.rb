require_relative "board.rb"
require_relative "cell.rb"
require_relative "renderer.rb"
require_relative "turn.rb"
require "pry"

include Render

board = Board.new

welcome_message
turn_1 = Turn.new(:ply_1, board)
turn_2 = Turn.new(:ply_2, board, is_cpu = true)

board.populate_columns
# binding.pry
loop do
    render_board(board)
    board.add_piece(turn_1.player, turn_1.prompt_user)
    render_board(board)
    board.add_piece(turn_2.player, turn_2.prompt_user)
end






# while game_state(board)
#     render_board(board)
#     turn_player_1
#     board.add(turn.player, turn.input)
#     return if game_state(board)
#     render_board(board)
#     turn_player_2
#     board(add(turn.player, turn.input))
#     game_state(board)
# end




# turn = Turn.new(:ply_1, board)
# turn.prompt_user
# turn = Turn.new(:ply_2, board)
# turn.prompt_user
# turn = Turn.new(:ply_1, board)
# turn.prompt_user
# turn = Turn.new(:ply_2, board)
# turn.prompt_user
# turn = Turn.new(:ply_1, board)
# turn.prompt_user
# turn = Turn.new(:ply_2, board)
# turn.prompt_user
# turn = Turn.new(:ply_1, board)
# turn.prompt_user
# turn = Turn.new(:ply_2, board)
# turn.prompt_user
# turn = Turn.new(:ply_1, board)
# turn.prompt_user
# turn = Turn.new(:ply_2, board)
# turn.prompt_user
# turn = Turn.new(:ply_1, board)
# turn.prompt_user
# turn = Turn.new(:ply_2, board)
# turn.prompt_user
# turn = Turn.new(:ply_1, board)
# turn.prompt_user
# turn = Turn.new(:ply_2, board)
# turn.prompt_user
# turn = Turn.new(:ply_1, board)
# turn.prompt_user
# turn = Turn.new(:ply_2, board)
# turn.prompt_user
# turn = Turn.new(:ply_1, board)
# turn.prompt_user
# turn = Turn.new(:ply_2, board)
# turn.prompt_user
# turn = Turn.new(:ply_1, board)
# turn.prompt_user
# turn = Turn.new(:ply_2, board)
# turn.prompt_user




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




