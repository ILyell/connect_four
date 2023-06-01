require_relative "board.rb"
require_relative "cell.rb"
require_relative "renderer.rb"
require_relative "turn.rb"
require_relative "game_start.rb"
require_relative "game_over.rb"
require_relative "player.rb"
require_relative "cpu_module.rb"

require "pry"

include Render
include GameStart
include GameOver
include CPU

system "clear"
game_start_message
start
loop do
    system "clear"
    puts "Enter one for one player or two for two player!"
    players = gets.chomp.to_s
    until (players == "one") || (players =="One")|| ((players == "two") || (players =="Two"))  
        turn_instruction
        players = gets.chomp.to_s
        error_message(:invalid_input, input)
    end
    enter_name_prompt
    player_1 = Player.new(gets.chomp, :ply_1) 
    if (players == "one") ||  (players == "One")
        player_2 = Player.new("CPU", :ply_2, true)
    elsif (players == "two") || (players == "Two")
        enter_name_prompt
        player_2 = Player.new(gets.chomp, :ply_2)
    end
    board = Board.new
    board.populate_columns
    turn_1 = Turn.new(player_1, board)
    turn_2 = Turn.new(player_2, board)

    render_board(board)
    


    loop do  
        render_board(board)
        turn_identifier(player_1)
        turn_instruction
        
        input = gets.chomp.to_s
        until turn_1.valid_input?(input)
            turn_instruction
            input = gets.chomp.to_s
        end
        input = turn_1.clean_input(input)
        board.add_piece(player_1.player, input)
        render_falling_piece(board)
        break if game_over?(board) != false
        
        turn_identifier(player_2)
        turn_instruction
        
        if player_2.is_cpu?
            # binding.pry
            input = cpu_turn(board)
        else 
            input = gets.chomp.to_s
            until turn_1.valid_input?(input)
                turn_instruction
                input = gets.chomp.to_s
            end
            input = turn_1.clean_input(input)
        end
        board.add_piece(player_2.player, input)
        render_falling_piece(board)
        break if game_over?(board) != false
    end

    render_board(board)

    end_condition = game_over?(board)

    if end_condition == :draw
        game_draw_message
    elsif end_condition == :ply_1
        game_win_message(player_1)
    elsif end_condition == :ply_2
        game_win_message(player_2)
    end
    
    break if !game_restart?
end
