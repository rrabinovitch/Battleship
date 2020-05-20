require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_has_a

  end

  def test_it_displays_a_menu
    menu = "Welcome to BATTLESHIP \n" +
            "Enter p to play. Enter q to quit."
    assert_equal menu, @game.display_menu
  end

  def test_computer_can_select_random_consecutive_coordinates
    comp_cruiser_coords = @game.computer_select_coordinates(@computer_cruiser)
    @game
  end
end
