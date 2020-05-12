require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_a_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_it_starts_without_a_ship
    assert_equal nil, @cell.ship
    assert_equal true, @cell.empty?
  end

  def test_a_ship_can_be_placed_in_a_cell_and_make_cell_not_empty
    @cell.place_ship(@cruiser)

    assert_equal @cruiser, @cell.ship
    assert_equal false, @cell.empty?
  end

  def test_it_has_not_been_fired_upon_by_default
    @cell.place_ship(@cruiser) #decide later whether necessary to keep

    assert_equal false, @cell.fired_upon?
  end

  def test_it_knows_when_cell_has_been_fired_upon
    @cell.place_ship(@cruiser)
    @cell.fire_upon

    assert_equal true, @cell.fired_upon?
  end

  def test_firing_upon_a_cell_decreases_ship_health
    @cell.place_ship(@cruiser)
    @cell.fire_upon

    assert_equal 2, @cell.ship.health
  end
end
