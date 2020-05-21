require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/human'
require './lib/game'

game = Game.new
game.display_menu
input = game.get_user_input
if input == "p"
  game.setup
  game.play
elsif input == "q"
  p "Thanks for playing!"
else
  p "Invalid input"
  input = game.get_user_input
end

# "=============COMPUTER BOARD============= \n
# 1 2 3 4 \n
# A . . . . \n
# B . . . . \n
# C . . . . \n
# D . . . . \n \n
# ==============YOUR BOARD============== \n
# 1 2 3 4 \n
# A S S S . \n
# B . . . . \n
# C . S . . \n
# D . S . . \n"
# "Here are each of our boards: \n
# =============COMPUTER BOARD============= \n
# 1 2 3 4 \n
# A . . . . \n
# B . . . . \n
# C . . . . \n
# D . . . . \n \n
# ==============YOUR BOARD============== \n
# 1 2 3 4 \n
# A S S S . \n
# B . . . . \n
# C . S . . \n
# D . S . . \n \n
# At the start of each turn, you'll see my board showing the cells at which you've already fired and your board showing your own ships and the cells at which I've already fired. \n
# Let's start playing! You'll fire first."
# "=============COMPUTER BOARD============= \n
# 1 2 3 4 \n
# A . . . . \n
# B . . . . \n
# C . . . . \n
# D . . . . \n \n
# ==============YOUR BOARD============== \n
# 1 2 3 4 \n
# A S S S . \n
# B . . . . \n
# C . S . . \n
# D . S . . \n"
