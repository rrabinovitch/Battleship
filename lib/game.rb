require './lib/game'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'


class Game

  def initialize
    @computer = Computer.new
    #@computer_ships = @turn.computer_ships?
    #@player_ships = @turn.player_ships?
    @player_board = @turn.player_board
    @computer_board = @turn.computer_board
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
