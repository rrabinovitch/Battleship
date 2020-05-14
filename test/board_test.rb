require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_equal 16, @board.cells.count
    assert_instance_of Hash, @board.cells
    # a way to test that the keys within the cells method point to cell objects
  end
end
