module Render

  def welcome_message
    system "clear"
    puts ""
    puts "█░░░█ █▀▀ █░░ █▀▀ █▀▀█ █▀▄▀█ █▀▀ 　 ▀▀█▀▀ █▀▀█".center(69)
    puts "█▄█▄█ █▀▀ █░░ █░░ █░░█ █░▀░█ █▀▀ 　 ░░█░░ █░░█".center(69)
    puts "░▀░▀░ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░░▀ ▀▀▀ 　 ░░▀░░ ▀▀▀▀".center(69),"\n"
    puts "░█████╗░░█████╗░███╗░░██╗███╗░░██╗███████╗░█████╗░████████╗  ░░██╗██╗"
    puts "██╔══██╗██╔══██╗████╗░██║████╗░██║██╔════╝██╔══██╗╚══██╔══╝  ░██╔╝██║"
    puts "██║░░╚═╝██║░░██║██╔██╗██║██╔██╗██║█████╗░░██║░░╚═╝░░░██║░░░  ██╔╝░██║"
    puts "██║░░██╗██║░░██║██║╚████║██║╚████║██╔══╝░░██║░░██╗░░░██║░░░  ███████║"
    puts "╚█████╔╝╚█████╔╝██║░╚███║██║░╚███║███████╗╚█████╔╝░░░██║░░░  ╚════██║"
    puts "░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░  ░░░░░╚═╝"
    puts "","=" * 69,""
    puts "Enter P to PLAY".center(69)
    puts "Enter Q to QUIT".center(69)
  end

  def render_board(board) 
    system "clear"
    
    puts "       ╔══╦══╦══╦══╦══╦══╦══╗"
    puts "       ║#{render_cell(board.columns[:a][5])}│#{render_cell(board.columns[:b][5])}│#{render_cell(board.columns[:c][5])}│#{render_cell(board.columns[:d][5])}│#{render_cell(board.columns[:e][5])}│#{render_cell(board.columns[:f][5])}│#{render_cell(board.columns[:g][5])}║"
    puts "       ╠──┼──┼──┼──┼──┼──┼──╣"
    puts "       ║#{render_cell(board.columns[:a][4])}│#{render_cell(board.columns[:b][4])}│#{render_cell(board.columns[:c][4])}│#{render_cell(board.columns[:d][4])}│#{render_cell(board.columns[:e][4])}│#{render_cell(board.columns[:f][4])}│#{render_cell(board.columns[:g][4])}║"
    puts "       ╠──┼──┼──┼──┼──┼──┼──╣"
    puts "       ║#{render_cell(board.columns[:a][3])}│#{render_cell(board.columns[:b][3])}│#{render_cell(board.columns[:c][3])}│#{render_cell(board.columns[:d][3])}│#{render_cell(board.columns[:e][3])}│#{render_cell(board.columns[:f][3])}│#{render_cell(board.columns[:g][3])}║"
    puts "       ╠──┼──┼──┼──┼──┼──┼──╣"
    puts "       ║#{render_cell(board.columns[:a][2])}│#{render_cell(board.columns[:b][2])}│#{render_cell(board.columns[:c][2])}│#{render_cell(board.columns[:d][2])}│#{render_cell(board.columns[:e][2])}│#{render_cell(board.columns[:f][2])}│#{render_cell(board.columns[:g][2])}║"
    puts "       ╠──┼──┼──┼──┼──┼──┼──╣"
    puts "       ║#{render_cell(board.columns[:a][1])}│#{render_cell(board.columns[:b][1])}│#{render_cell(board.columns[:c][1])}│#{render_cell(board.columns[:d][1])}│#{render_cell(board.columns[:e][1])}│#{render_cell(board.columns[:f][1])}│#{render_cell(board.columns[:g][1])}║"
    puts "       ╠──┼──┼──┼──┼──┼──┼──╣"
    puts "       ║#{render_cell(board.columns[:a][0])}│#{render_cell(board.columns[:b][0])}│#{render_cell(board.columns[:c][0])}│#{render_cell(board.columns[:d][0])}│#{render_cell(board.columns[:e][0])}│#{render_cell(board.columns[:f][0])}│#{render_cell(board.columns[:g][0])}║"
    puts "       ╠══╬══╬══╬══╬══╬══╬══╣"
    puts "       ║🅐 ║🅑 ║🅒 ║🅓 ║🅔 ║🅕 ║🅖 ║"
    puts "       ╠══╩══╩══╩══╩══╩══╩══╣"
    puts "      ═╩═                  ═╩═ "
  end

  def error_message(type, input)
    if type == :invalid_column
      print "\n\"#{input}\" is not a valid column.\nPlease choose a valid column A-G.\n"
    elsif type == :full_column
      print "Column #{input.upcase} is full! Choose an open one.\n"
    elsif type == :invalid_option
      print "Please enter a valid option\n"
    end
  end
  
  def render_cell(cell)
    if cell.empty?
      "  "
    elsif cell.ply_1?
      "🔴"
    elsif cell.ply_2?
      "🔵"
    end
  end
  
  def turn_identifier(player)
    if player.player == :ply_1
      piece_flair = "🔴"
    else
      piece_flair = "🔵"
    end

    puts "It's #{piece_flair}#{player.name}'s turn"
  end

  def turn_instruction
    system "clis"
    puts "\nChoose a column A-G, or type 'quit' to quit.\n\n"
  end

  def enter_name_prompt
    puts "\n What's your name?"
  end

  def game_win_message(player)
    if player == :ply_1
      puts "\n         You win!"
    else
      puts "\n         You lose!"
    end
  end

  def game_draw_message
    puts "It's a draw"
  end

  def render_restart
    puts "Enter Y to play again N to quit."
  end

  def render_falling_piece(board)
    last_piece = board.columns[board.last_piece[0]][board.last_piece[1]]
    player = last_piece.status
    board.columns[board.last_piece[0]][((board.last_piece[1]..5))].reverse.each do |piece|
      last_piece.set_ply(:empty)
      render_board(board)
      piece.set_ply(player)
      render_board(board)
      sleep 0.05
      piece.set_ply(:empty)
      render_board(board)
    end
    last_piece.set_ply(player)
    render_board(board)
  end
end
