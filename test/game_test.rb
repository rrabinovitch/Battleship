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

  def test_it_displays_a_menu
    menu = "Welcome to BATTLESHIP \n" +
            "Enter p to play. Enter q to quit."
    assert_equal menu, @game.display_menu
  end

  def test_game_starts_if_user_enters_p
    skip
  end

  def test_game_quits_if_user_enters_q
    skip
    # a stub that returns the value q?
  end

  def test_

  end
end
