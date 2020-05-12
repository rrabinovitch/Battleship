require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_it_has_a_name_a_length_and_health
    assert_equal "Cruiser", @cruiser.name
    assert_equal 3, @cruiser.length
    assert_equal 3, @cruiser.health
  end

  def test_it_is_not_sunk_by_default
    refute @cruiser.sunk?
  end

  def test_it_can_be_hit
    assert_equal 2, @cruiser.hit
  end

  def test_it_can_be_sunk
    3.times do @cruiser.hit
    end
    
    assert_equal true, @cruiser.sunk?
  end
end
