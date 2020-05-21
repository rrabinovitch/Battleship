require './lib/game'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'

  p "Welcome to BattleShip!"
  p  "All captians are required to have a name. What is your name?"
  user_name = get.chomp
  p "Type 'p' to (p)lay or 'q' to (q)uit!"
  p "------------------------------------------------------------------"
  user_input = gets.chomp
  loop do
    if user_input == "p" || user_input == "play"
      p "Good luck Captian #{user_name}!"
      game = Game.new
      #game.#place ship methods
      #game.#turn method
    elsif user_input == "q" || user_input == "quit"
      p "Thank you for playing #{user_name}!"
        break
    else
      p  "Invalid input, please try again!"
    end
  end
