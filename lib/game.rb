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
end
