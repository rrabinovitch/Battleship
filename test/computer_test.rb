require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/human'
require 'mocha/minitest'

class ComputerTest < Minitest::Test
  def setup
    @computer = Computer.new
    @computer_board = @computer.board
    @cruiser = @computer.cruiser
    @submarine = @computer.submarine

    @human = Human.new
  end

  def test_it_exists
    skip
    assert_instance_of Computer, @computer
  end

  def test_it_has_a_board_and_two_ships
    skip
    assert_instance_of Board, @computer.board
    assert_equal @cruiser, @computer.cruiser
    assert_equal @submarine, @computer.submarine
  end

  def test_it_starts_with_no_coordinates_guessed
    skip
    assert_equal [], @computer.coordinates_guessed
  end

  def test_it_can_select_valid_coordinates_for_ship_placement
    skip
    assert_equal 3, @computer.select_placement_coordinates(@cruiser).count
    assert_equal 2, @computer.select_placement_coordinates(@submarine).count

    # assert true that the coordinates that were
    # randomly selected for each ship pass through
    # the board.valid_placement?(ship, coordinates) method
      # figure out how to parse out components for testing this
  end

  def test_it_can_place_cruiser
    skip
    @computer.stubs(:select_placement_coordinates).returns(["A1", "A2", "A3"])
    @computer.place_cruiser

    revealed_board = "  1 2 3 4 \n" +
                    "A S S S . \n" +
                    "B . . . . \n" +
                    "C . . . . \n" +
                    "D . . . . \n"

    assert_equal revealed_board, @computer.board.render(true)
  end

  def test_it_can_place_submarine # something with ship placement not working
    skip
    @computer.stubs(:select_placement_coordinates).returns(["C2", "D2"])
    @computer.place_submarine

    revealed_board = "  1 2 3 4 \n" +
                    "A . . . . \n" +
                    "B . . . . \n" +
                    "C . S . . \n" +
                    "D . S . . \n"
    assert_equal revealed_board, @computer.board.render(true)
  end


end
