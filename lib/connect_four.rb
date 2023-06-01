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
    input = gets.chomp
    enter_name_prompt
    player_1 = Player.new(gets.chomp, :ply_1) 
    if input == "one"
        player_2 = Player.new("CPU", :ply_2, true)
    elsif input == "two"
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
        break if game_over?(board) != false
        render_board(board)
        
        turn_identifier(player_2)
        turn_instruction
        
        if player_2.is_cpu?
            # binding.pry
            cpu_input = cpu_turn(board)
            until board.full_column?(cpu_input) == false
                cpu_input = cpu_turn(board)
            end
        else 
            input = gets.chomp.to_s
            until turn_1.valid_input?(input)
                turn_instruction
                input = gets.chomp.to_s
            end
        end
        input = turn_1.clean_input(input)
        board.add_piece(player_2.player, input)
        break if game_over?(board) != false
    end

    render_board(board)

    end_condition = game_over?(board)

    if end_condition == :draw
        game_draw_message
    elsif end_condition == :ply_1
        game_win_message(:ply_1)
    elsif
        game_win_message(:ply_1)
    end
    
    break if !game_restart?
end
