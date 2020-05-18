require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @player_board = Board.new
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @turn = Turn.new(@player_board, @computer_board)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_player_board
    assert_equal @player_board, @turn.player_board
  end

  def test_it_has_a_computer_board
    assert_equal @computer_board, @turn.computer_board
  end

  def test_player_can_fire_at_a_cell

    # result: cell should be fired upon
    # check player.board.cell to make sure it's been fired upon
    assert_equal expected, @turn.select_cell_to_fire_upon()
  end
  #
  # def test_it_can_identify_remaining_cells_on_each_board
  #   assert_equal
  # end
  #
  # def test_it_has_a_result
  # end
end
