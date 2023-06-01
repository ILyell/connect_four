require_relative "board.rb"
require_relative "cell.rb"
require_relative "renderer.rb"
require_relative "turn.rb"
require_relative "game_start.rb"
require_relative "game_over.rb"
require_relative "player.rb"

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

    enter_name_prompt

    player_1 = Player.new(gets.chomp, :ply_1) 
    player_2 = Player.new("CPU", :ply_2, true)
    
    turn_1 = Turn.new(player_1, board)
    turn_2 = Turn.new(player_2, board)

    render_board(board)
    
    turn_number = 1

    until game_over?(board, board.last_piece) != false
        # Determines if it's P1 or P2's turn
        if turn_number.odd?
            current_player = player_1
        else
            current_player = player_2
        end

        # Render the board, say whose turn it is, and give instructions on the turn.
        render_board(board)
        turn_identifier(current_player)
        turn_instruction
        
        input = gets.chomp.to_s
        until turn_1.valid_input?(input)
            turn_instruction
            input = gets.chomp
        end

        input = turn_1.clean_input(input)

        board.add_piece(current_player, input)
        turn_number += 1
    end

    render_board(board)

    end_condition = game_over?(board, board.last_piece)

    if end_condition == :draw
        game_draw_message
    elsif end_condition == :ply_1
        game_win_message(:ply_1)
    elsif
        game_win_message(:ply_1)
    end
    
    break if !game_restart?
end
