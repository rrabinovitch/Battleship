require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/human'
require './lib/game'

game = Game.new
game.display_menu
input = game.get_user_input.downcase
if input == "p"
  puts "..."
  sleep(2.5)
  system 'clear'
  game.setup
elsif input == "q"
  puts "Thanks for playing!"
else
  puts "Invalid input. Goodbye!"
end
