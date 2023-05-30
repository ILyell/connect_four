1. Run connect_four.rb
welcome message
Play/Quit




## ruby connect_four

- welcome_screen
- get user input (assuming start game)
- board.new
- render_board
- while not game over do :
- player_1.turn?
- turn.get_user_input
- board.add_piece(turn_output)
- render_board
- board.game_state
- Either Contiune to next turn or Endgame (Win/Loss/Draw)
- turn.change_player?
- player_2.turn
- ...see previous
- once endgame reached do
- Render Win/Loss/Draw
- Render restart?




cpu_turn module
   def 
      [:a,:b,:c].random
   end













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
  system "clear"
    print " A  B  C  D  E  F  G" 
    board.columns.each do |column, cells|
      row = ""
      cells.each do |cell|
        row << "#{render_cell(cell)} "
      end
      print " #{row}" 
    end
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
      


### POTENTIAL FUTURE AESTHETIC ITERATION?

  1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣
5 ⬜️ 🔴 ⬜️ ⬜️ ⬜️ ⬜️ ⬜️
4 ⬜️ ⬜️ 🔴 ⬜️ ⬜️ ⬜️ ⬜️
3 ⬜️ ⬜️ ⬜️ 🔴 ⬜️ ⬜️ ⬜️
2 ⬜️ ⬜️ ⬜️ ⬜️ 🔴 ⬜️ ⬜️
1 ⬜️ ⬜️ ⬜️ ⬜️ ⬜️ ⬜️ ⬜️
0 ⬜️ ⬜️ ⬜ ⬜️ ⬜️ ⬜️ ⬜️
 

A  B  C  D  E  F  G

⬜️ ⬜️ ⬜️ ⬜️ ⬜️ ⬜️ ⬜️
⬜️ ⬜️ ⬜️ ⬜️ ⬜️ ⬜️ ⬜️
⬜️ ⬜️ ⬜️ ⬜️ ⬜️ ⬜️ ⬜️
⬜️ ⬜️ ⬜ 🔴 🟡 ⬜️ ⬜️

The spacing with letters and emojis in the terminal output is not consistent, so I think we would need to play around and find something that works.



     0 1 2 3 4 5 6
   5 * * * * * * *
   4 * * * * * * *
   3 * * * X * * *
   2 * * X * * * *
   1 * X * * * * *
   0 X * * * * * *