equire 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/human'

class HumanTest < Minitest::Test
  def setup
    @human = Human.new
  end

  def test_it_exists
    assert_instance_of Human, @human
  end

  def test_it_has_a_board_and_two_ships
    assert_equal 
  end
end
