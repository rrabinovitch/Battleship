class Game

  def initialize
  end

  def process
    display_menu
    input = get_user_input
    if input == "p"
      # or, consider an until loop: until input == "q" display menu
      # within
      start_game
    elsif input == "q"
      p "Thanks for playing!"
    end

  end

  def get_user_input
    gets.chomp
  end

  def display_menu
    p "Welcome to BATTLESHIP \n" + "Enter p to play. Enter q to quit."

  end

  def start_game
    # create a new turn
    # prompt user to input cell to fire at: choose a cell
      # user_input = gets.chomp
    # player_fires_at(user_input)
  end

  def end_game

  end


end
