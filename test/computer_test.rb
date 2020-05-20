require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'

class ComputerTest < Minitest::Test
  def setup
    @computer = Computer.new
  end

  def test_it_exists
    assert_instance_of Computer, @computer
  end

  def test_it_has_a_board_and_two_ships
    assert_instance_of Board, @computer.board
    assert_instance_of Ship, @computer.cruiser
    assert_instance_of Ship, @computer.submarine
  end

  def test_it_starts_with_no_coordinates_guessed
    assert_equal [], @computer.coordinates_guessed
  end
end
