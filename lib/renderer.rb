module Renderer

  def welcome_message
    puts "\nWelcome to CONNECT 4\n\n"
  end

  def render_board(board) 
    system "clear"
    print " A B C D E F G\n"
    print " #{render_cell(board.columns[:a][5])} #{render_cell(board.columns[:b][5])} #{render_cell(board.columns[:c][5])} #{render_cell(board.columns[:d][5])} #{render_cell(board.columns[:e][5])} #{render_cell(board.columns[:f][5])} #{render_cell(board.columns[:g][5])}\n"
    print " #{render_cell(board.columns[:a][4])} #{render_cell(board.columns[:b][4])} #{render_cell(board.columns[:c][4])} #{render_cell(board.columns[:d][4])} #{render_cell(board.columns[:e][4])} #{render_cell(board.columns[:f][4])} #{render_cell(board.columns[:g][4])}\n"
    print " #{render_cell(board.columns[:a][3])} #{render_cell(board.columns[:b][3])} #{render_cell(board.columns[:c][3])} #{render_cell(board.columns[:d][3])} #{render_cell(board.columns[:e][3])} #{render_cell(board.columns[:f][3])} #{render_cell(board.columns[:g][3])}\n"
    print " #{render_cell(board.columns[:a][2])} #{render_cell(board.columns[:b][2])} #{render_cell(board.columns[:c][2])} #{render_cell(board.columns[:d][2])} #{render_cell(board.columns[:e][2])} #{render_cell(board.columns[:f][2])} #{render_cell(board.columns[:g][2])}\n"
    print " #{render_cell(board.columns[:a][1])} #{render_cell(board.columns[:b][1])} #{render_cell(board.columns[:c][1])} #{render_cell(board.columns[:d][1])} #{render_cell(board.columns[:e][1])} #{render_cell(board.columns[:f][1])} #{render_cell(board.columns[:g][1])}\n"
    print " #{render_cell(board.columns[:a][0])} #{render_cell(board.columns[:b][0])} #{render_cell(board.columns[:c][0])} #{render_cell(board.columns[:d][0])} #{render_cell(board.columns[:e][0])} #{render_cell(board.columns[:f][0])} #{render_cell(board.columns[:g][0])}"
  end
  def render_cell(cell)
    if cell.empty?
      "*"
    elsif cell.ply_1?
      "X"
    elsif cell.ply_2?
      "O"
    end
  end
end
