<<<<<<< Updated upstream
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

  def take_turn
    player_shot #in turn.rb?
    computer_shot #in turn.rb?
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

=======
require './lib/menu'
require './lib/game_setup'
require './lib/ship'
require './lib/board'

class Game

  def initialize
    @menu = Menu.new
    @setup = Setup.new
    @all_player_shots = []
    @all_computer_shots = []
    @computer_ships = @setup.computer_ships
    @player_ships = @setup.player_ships
    @response = @menu.respose
    @player_board = @setup.player_board
    @computer_board = @setup.computer_board
  end


  def start_from_menu
    @menu.start_display_menu
    if @menu.response == "P" || @menu.response == "PLAY"
      play_game()
    end
  end

  def display_game_boards
      p "=============COMPUTER BOARD============= "
     @computer_board.render
     p "==============PLAYER BOARD=============="
     @player_board.render(true)
  end

  def take_turn
    player_shot #in turn.rb?
    computer_shot #in turn.rb?
  end

  def computer_wins
    @player_ships.all? {|ship| ship.sunk?}
  end

  def human_wins
    @computer_ships.all? {|ship| ship.sunk?}
  end

  def play_game
    @computer.place_computer_ships
    @human.place_player_ships
    display_game_boards
    take_turn until computer_wins || human_wins
    if computer_wins
      p "-----------------------------"
      p "The Computer is Victorious!!!"
      p "-----------------------------"
    elsif human_wins
      p "-----------------------------"
      p "#{user_name} is Victorious!!!"
      p "-----------------------------"
    end
  end
>>>>>>> Stashed changes
end
