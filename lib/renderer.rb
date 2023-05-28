module Render

  def welcome_message
    # system "clear"
    puts "\nWelcome to CONNECT 4\n\nEnter P to play or Q to quit!"
  end

  def error_message(type, input)
    if type == :invalid_column
      print "#{input} is an invalid column"
    elsif type == :full_column
      print "#{input} column is full!"
    elsif type == :invalid_option
      printgit `` "Please enter a valid option\n"
    end
  end

  def render_board(board) 
    system "clear"
    puts "\n    A B C D E F G\n\n"
    puts "    #{render_cell(board.columns[:a][5])} #{render_cell(board.columns[:b][5])} #{render_cell(board.columns[:c][5])} #{render_cell(board.columns[:d][5])} #{render_cell(board.columns[:e][5])} #{render_cell(board.columns[:f][5])} #{render_cell(board.columns[:g][5])}\n"
    puts "    #{render_cell(board.columns[:a][4])} #{render_cell(board.columns[:b][4])} #{render_cell(board.columns[:c][4])} #{render_cell(board.columns[:d][4])} #{render_cell(board.columns[:e][4])} #{render_cell(board.columns[:f][4])} #{render_cell(board.columns[:g][4])}\n"
    puts "    #{render_cell(board.columns[:a][3])} #{render_cell(board.columns[:b][3])} #{render_cell(board.columns[:c][3])} #{render_cell(board.columns[:d][3])} #{render_cell(board.columns[:e][3])} #{render_cell(board.columns[:f][3])} #{render_cell(board.columns[:g][3])}\n"
    puts "    #{render_cell(board.columns[:a][2])} #{render_cell(board.columns[:b][2])} #{render_cell(board.columns[:c][2])} #{render_cell(board.columns[:d][2])} #{render_cell(board.columns[:e][2])} #{render_cell(board.columns[:f][2])} #{render_cell(board.columns[:g][2])}\n"
    puts "    #{render_cell(board.columns[:a][1])} #{render_cell(board.columns[:b][1])} #{render_cell(board.columns[:c][1])} #{render_cell(board.columns[:d][1])} #{render_cell(board.columns[:e][1])} #{render_cell(board.columns[:f][1])} #{render_cell(board.columns[:g][1])}\n"
    puts "    #{render_cell(board.columns[:a][0])} #{render_cell(board.columns[:b][0])} #{render_cell(board.columns[:c][0])} #{render_cell(board.columns[:d][0])} #{render_cell(board.columns[:e][0])} #{render_cell(board.columns[:f][0])} #{render_cell(board.columns[:g][0])}"
  end

  # def turn_message(player)
  #   puts "its #{clean_player}"
  # end

  def render_cell(cell)
    if cell.empty?
      "*"
    elsif cell.ply_1?
      "X"
    elsif cell.ply_2?
      "O"
    end
  end
  
  def turn_instruction
    system "clis"
    puts "\nChoose a column A-G, or type 'quit' to quit.\n\n"
  end
end
