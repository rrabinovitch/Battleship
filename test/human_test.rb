require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/human'
require './lib/computer'
require 'mocha/minitest'

class HumanTest < Minitest::Test
  def setup
    @human = Human.new
    @human_board = @human.board
    @cruiser = @human.cruiser
    @submarine = @human.submarine

    @computer = Computer.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
  end

  def computer_board_setup
    @computer.board.place(@computer_cruiser, ["A1", "B1", "C1"])
    @computer.board.place(@computer_submarine, ["D2", "D3"])
  end

  def test_it_exists
    assert_instance_of Human, @human
  end

  def test_it_has_a_board_and_two_ships
    assert_instance_of Board, @human.board
    assert_equal @cruiser, @human.cruiser
    assert_equal @submarine, @human.submarine
  end

  def test_it_starts_with_no_coordinates_guessed
    assert_equal [], @human.coordinates_guessed
  end

  def test_it_can_place_ships
    skip #INCOMPLETE TEST
    coord_1 = mock("A1")
    coord_2 = mock("B1")
    coord_3 = mock("C1")
    @human.place_cruiser
    # mocks not working when calling .place_cruiser

    revealed_board = "  1 2 3 4 \n" +
                    "A S . . . \n" +
                    "B S . . . \n" +
                    "C S . . . \n" +
                    "D . . . . \n"

    assert_equal revealed_board, @human.board.render(true)

    # place submarine >> update revealed_board >> assert
    # new revealed board and @human.board.render(true)
    # both have cruiser and sub placed in same coords
  end

  def test_it_can_fire_at_computer_board
    skip #INCOMPLETE TEST
    computer_board_setup

    user_input.stubs(:select_cell_to_fire).returns("A1")
    @human.fire(@computer_board)
  end

  def test_if_human_has_lost
    skip #INCOMPLETE TEST
    assert_equal false, @human.lost?

    assert_equal true, @human.lost?
  end
end
