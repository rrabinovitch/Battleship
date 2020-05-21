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
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
  end

  def human_board_setup
    @human.board.place(@human_cruiser, ["A1", "B1", "C1"])
    @human.board.place(@human_submarine, ["D2", "D3"])
  end

  def test_it_exists
    assert_instance_of Computer, @computer
  end

  def test_it_has_a_board_and_two_ships
    assert_instance_of Board, @computer.board
    assert_equal @cruiser, @computer.cruiser
    # this test might not be useful since these values are literally set to equal each other in the setup method
    assert_instance_of Ship, @computer.cruiser
    assert_equal @submarine, @computer.submarine
    # same comment as above about submarine
    assert_instance_of Ship, @computer.submarine
  end

  def test_it_starts_with_no_coordinates_guessed
    assert_equal [], @computer.coordinates_guessed
  end

  def test_it_can_select_valid_coordinates_for_ship_placement
    assert_equal 3, @computer.select_placement_coordinates(@cruiser).count
    assert_equal 2, @computer.select_placement_coordinates(@submarine).count


    #@computer.expects(:random_coord).returns(["D2", "D3", "D4"])
    #assert_equal ["D2", "D3", "D4"], @computer.select_placement_coordinates(@cruiser)

    # assert true that the coordinates that were
    # randomly selected for each ship pass through
    # the board.valid_placement?(ship, coordinates) method
      # figure out how to parse out components for testing this
    # consider asserting that the returned array of coordinates are
    # included in board.cells.keys??
  end

  def test_it_can_place_cruiser
    @computer.stubs(:select_placement_coordinates).returns(["A1", "A2", "A3"])
    @computer.place_cruiser

    revealed_board = "  1 2 3 4\n" +
                    "A S S S .\n" +
                    "B . . . .\n" +
                    "C . . . .\n" +
                    "D . . . ."

    assert_equal revealed_board, @computer.board.render(true)
  end

  def test_it_can_place_submarine # something with ship placement not working
    @computer.stubs(:select_placement_coordinates).returns(["C2", "D2"])
    @computer.place_submarine
    revealed_board = "  1 2 3 4\n" +
                    "A . . . .\n" +
                    "B . . . .\n" +
                    "C . S . .\n" +
                    "D . S . ."
    assert_equal revealed_board, @computer.board.render(true)
  end

  # consider refactoring to use a single place_ship method
  # => adjust tests accordingly

  def test_it_can_fire_at_human_board
    skip #INCOMPLETE TEST
    human_board_setup
    selection_1 = mock("A1")
    selection_2 = mock("A2")
    selection_3 = mock("B1")

    @computer.fire(@human.board)

    revealed_board_1 = "  1 2 3 4" +
                      "A H M . ." +
                      "B H . . ." +
                      "C . S . ." +
                      "D . S . ."
    assert_equal revealed_board_1, @human.board.render(true)
  end

  def test_if_computer_has_lost
    skip #INCOMPLETE TEST

    assert_equal false, @computer.lost?
    assert_equal true, @computer.lost?
  end
end
