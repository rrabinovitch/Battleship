# require './lib/turn'

#
# removed computer_select_coordinates
# computer_place_ships
class Game

  def initialize
    @human = Human.new
    @computer = Computer.new
    # @game_winner = ""
    # @human_cruiser = Ship.new("Cruiser", 3)
    # @human_submarine = Ship.new("Submarine", 2)
    #
    # @computer_cruiser = Ship.new("Cruiser", 3)
    # @computer_submarine = Ship.new("Submarine", 2)
    #
    # @turn = Turn.new(@human_board = Board.new, @computer_board = Board.new)
  end

  def get_user_input
    gets.chomp
  end

  def display_menu
    p "Welcome to BATTLESHIP \n" +
      "Enter p to play. Enter q to quit."
  end



  # def human_place_cruiser
  #   p "Enter the coordinates for where you'd like to place your Cruiser (3 spaces):"
  #   get_user_input
  #
  # end
  #
  # def human_place_submarine
  #
  # end

  def start
    computer_place_ships
    human_place_ships

    # create a new turn
    # prompt user to input cell to fire at: choose a cell
      # user_input = gets.chomp
    # player_fires_at(user_input)
  end

  def end_game #or game_over? (true if winner != nil)

  end

  def setup
    #
  end

end
