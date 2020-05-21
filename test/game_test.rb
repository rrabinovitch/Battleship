require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/human'
require './lib/computer'
require './lib/game'
require 'mocha/minitest'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
    @human = @game.human
    @computer = @game.computer
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_has_human_and_computer_players
    assert_equal @human, @game.human
    assert_instance_of Human, @game.human
    assert_equal @computer, @game.computer
    assert_instance_of Board, @computer.board
  end

  def test_it_displays_a_menu
    menu = "Welcome to BATTLESHIP \n" +
            "Enter p to play. Enter q to quit."
    assert_equal menu, @game.display_menu
  end

  def test_computer_can_select_random_consecutive_coordinates

  end
end
