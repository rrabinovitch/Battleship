require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'
require './lib/game'

game = Game.new
game.display_menu
input = game.get_user_input
if input == "p"
  game.start
elsif input == "q"
  p "Thanks for playing!"
else
  p "Invalid input"
  input = game.get_user_input
# until the user input = p, keep asking this question
# look into abort statement
end
