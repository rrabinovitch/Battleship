require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'


class Turn
  attr_reader :human_board,
              :computer_board

  def initialize(human_board, computer_board)
    @human_board = human_board
    @computer_board = computer_board
    @computer_ships = []
    @player_ships = []
  end

  def human_fires_at_computer(user_input)
    # user_input generated via gets.chomp
    if @computer_board.valid_coordinate?(user_input)
      @computer_board.cells[user_input].fire_upon
    else
      p "This is an invalid coordinate. Select another one to fire at."
    end
  end

  def computer_select_cell
    @human_board.cells.keys.sample
  end

  def computer_fires_at_user(random_cell)
    @human_board.cells[random_cell].fire_upon
  end

  def display_computer_board
    "=============COMPUTER BOARD============= \n" +
    "#{@computer_board.render} \n"
  end

  def display_human_board
    "==============PLAYER BOARD============== \n" +
    "#{@human_board.render(true)} \n"
  end

  def display_turn_results
    p "#{display_computer_board} + #{display_human_board}"
  end

  def computer_wins
    @player_ships.all? {|ship| ship.sunk?}
  end

  def human_wins
   @computer_ships.all? {|ship| ship.sunk?}
  end

end
