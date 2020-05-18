require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @human_board = Board.new
    @computer_board = Board.new
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @turn = Turn.new(@player_board, @computer_board)

    @human_board.place(@human_cruiser, ["A1", "A2", "A3"])
    @human_board.place(@human_submarine, ["C1", "C2"])

    @comptuter_board.place(@comptuter_cruiser, ["B1", "B2", "B3"])
    @comptuter_board.place(@comptuter_submarine, ["D1", "D2"])
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_player_board
    assert_equal @player_board, @turn.player_board
    # test rendering of board
  end

  def test_it_has_a_computer_board
    assert_equal @computer_board, @turn.computer_board
    # test rendering of board
  end

  def test_player_can_fire_at_a_cell
    @turn.player_fires_at(@computer_board.cells["A4"].fire_upon)
    assert_equal "M", @turn.computer_board.cells["A4"].render
    # result: cell should be fired upon
    # check player.board.cell to make sure it's been fired upon


    # rendering of the cell

    # testing hitting a cell that has a ship
    # => ship health
  end
  #
  # def test_it_can_identify_remaining_cells_on_each_board
  #   assert_equal
  # end
  #
  # def test_it_has_a_result
  # end
end
