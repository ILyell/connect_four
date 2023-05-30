require 'io/console'
# This takes a keyboard input and allows us to do things like have an arrow under the letter and move it with left arrow key
def read_char
    STDIN.echo = false
    STDIN.raw!
  
    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
  ensure
    STDIN.echo = true
    STDIN.cooked!
  
    return input
end

puts "Use the arrows keys to select an option!"
puts "\n\nPlay!         Quit!"
loop do
    if read_char ==  "nil"
        puts ""
    elsif read_char == "\e[D"
        puts "\n-----"
    elsif read_char == "\e[C"
        system "clear"
        puts "\n                 -----"
    elsif read_char == "q"
        exit
    end
end