require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/human'
require './lib/game'

game = Game.new
game.display_menu
input = game.get_user_input
# add self correction for lower and upper case p's and q's
if input == "p"
  game.setup
  game.play
elsif input == "q"
  puts "Thanks for playing!"
else
  puts "Invalid input"
  input = game.get_user_input
  # quits after receiving second input attempt
  # try defining all the above in a method within Game
  # and calling the method in here
end
