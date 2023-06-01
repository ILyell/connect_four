require_relative 'game_over'
module CPU

include GameOver

    def cpu_turn(board)
        move = (winning_move(:ply_2, board)
        player_move = winning_move(:ply_1, board)
        if player_move == !nil && move == !nil
            move
        elsif winning_move(:ply_2, board) == !nil
            move = winning_move(:ply_2, board)
        elsif winning_move(:ply_1, board) == !nil
            move = winning_move(:ply_1, board)
        else
            move = board.columns.keys.sample
        end
        move
    end

    def winning_move(player, board)
        result = false
        board_hold = board
        board.columns.keys.each do |key|
            board_hold.add_piece(player, key)
            if game_over?(board) == player
                result = key
                break
            else 
                result = false
            end
            board.columns[board.last_piece[0]][board.last_piece[1]].set_ply(:empty)
            # binding.pry
        end
        result
    end
end