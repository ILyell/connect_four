require_relative 'game_over'
module CPU

include GameOver

    def cpu_turn(board)
        cpu_move = winning_move(:ply_2, board)
        player_move = winning_move(:ply_1, board)
        # binding.pry
        move = board.columns.keys.sample
        until board.full_column?(move) == false
            move = board.columns.keys.sample
        end
        #if player next move is win and cpu next move is win, cpu picks win
        if (player_move != false) && (cpu_move != false)
            move = cpu_move
        #if cpu's next move will win, play next cpu move
        elsif cpu_move != false
            move = cpu_move 
        elsif player_move != false
            move =  player_move 
        end
        if board.full_column?(move)
            until board.full_column?(move) == false
                move = board.columns.keys.sample
            end
        end
        move
    end

    def winning_move(player, board)
        result = false
        last_piece_hold = board.last_piece
        board.columns.keys.each do |key|
            board.add_piece(player, key)
            # binding.pry
            if game_over?(board) == player
                result = key
                board.columns[board.last_piece[0]][board.last_piece[1]].set_ply(:empty)
                board.change_last_piece(last_piece_hold)
                # binding.pry
                break
            else 
                result = false
                board.columns[board.last_piece[0]][board.last_piece[1]].set_ply(:empty)
                board.change_last_piece(last_piece_hold)
            end
        end
        result
    end
end