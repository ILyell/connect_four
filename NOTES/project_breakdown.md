1. Run connect_four.rb
welcome message
Play/Quit

Create Board 
     - 6 x 7
     A B C D E F G
     . . . . . . .
     . . . . . . .
     . . . . . . .
     . . . . . . .
     . . . . . . .
     . . . . . . .

     Board #starts empty 
        @A: = [cell_0,cell_2,cell_3]
        @B: = []
        @C: ...
        @D
        @E
        @F
        @G
    

     start_board
     board_array = [A,B,C...]
     board_array.each do |column|  
        6.times do
        column << cell.new
      
      add_piece(player, column)
      end

Create Cells
    - 42 Cells, @status = :empty, :ply_1, :ply_2
    #change_status_ply_1
    #change_status()?
 Fill board with cells
 
Render board

Player class: 
   @ply = ply_1


Turn class

   initialize(player)
   @player = player


player_1 
player_2

turn :

def inialize(player)

get_chomp

   player_1.

   
   Ask user for a letter A..G

   Update board, Letter to lowest postion in column.

   Display new board

   Invalid options letters H+...

   def start_turn(player)

   def get_input( input)
      checks if valid
         valid = 
            board.add_piece(player, input)
      



