require_relative "board.rb"
require_relative "cell.rb"
require_relative "renderer.rb"
require_relative "turn.rb"
require_relative "game_start.rb"
require_relative "game_over.rb"

require "pry"

include Render
include GameStart
include GameOver

loop do
    system "clear"
    game_start_message
    start
    board = Board.new
    
    
    board.populate_columns
    player_1 = Player.new(gets.chomp, :ply_1)
    if 1player 
        player_2 = Player.new("CPU")
    elsif 2player
        player_2 = Player.new(gets.chomp, :ply_)
        
    end
    turn_1 = Turn.new(player_1, board)
    turn_2 = Turn.new(player_2, board)
    loop do
        render_board(board)
        turn_1.update_board(board)
        
        board.add_piece(turn_1.player, turn_1.prompt_user)
        # render_falling_piece(board)
        break if game_over?(board, board.last_piece) == (:ply_1 || :draw)
        
        render_board(board)
        turn_2.update_board(board)
        
        board.add_piece(turn_2.player, turn_2.prompt_user)
        # render_falling_piece(board)
        
        break if game_over?(board, board.last_piece) == (:ply_2 || :draw)
    end

    render_board(board)
    
    if game_over?(board, board.last_piece) == :ply_1
        game_win_message(:ply_1)
    else 
        game_win_message(:ply_2)
    end
    break if !game_restart?
end
