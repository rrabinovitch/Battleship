require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def setup
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell_1
  end

  def test_it_has_a_coordinate
    assert_equal "B4", @cell_1.coordinate
  end

  def test_it_starts_without_a_ship
    assert_nil @cell_1.ship
    assert_equal true, @cell_1.empty?
  end

  def test_a_ship_can_be_placed_in_a_cell_and_make_cell_not_empty
    @cell_1.place_ship(@cruiser)

    assert_equal @cruiser, @cell_1.ship
    assert_equal false, @cell_1.empty?
  end

  def test_it_has_not_been_fired_upon_by_default
    @cell_1.place_ship(@cruiser) #decide later whether necessary to keep

    assert_equal false, @cell_1.fired_upon?
  end

  def test_it_knows_when_cell_1_has_been_fired_upon
    @cell_1.place_ship(@cruiser)
    @cell_1.fire_upon

    assert_equal true, @cell_1.fired_upon?
  end

  def test_firing_upon_a_cell_decreases_ship_health
    @cell_1.place_ship(@cruiser)
    @cell_1.fire_upon

    assert_equal 2, @cell_1.ship.health
  end

  def test_it_can_be_rendered_when_no_ship_before_being_fired_upon
    assert_equal ".", @cell_1.render
  end

  def test_it_can_be_rendered_as_a_miss_when_no_ship_after_being_fired_upon
    @cell_1.fire_upon

    assert_equal "M", @cell_1.render
  end

  def test_it_can_be_rendered_with_ship_after_being_fired_upon
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon

    assert_equal "H", @cell_2.render
  end

  def test_it_can_render_a_ship_without_being_hit_when_passed_true_argument
    @cell_2.place_ship(@cruiser)

    assert_equal "S", @cell_2.render(true)
  end

  def test_it_can_render_a_ship_when_sunk
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
    
    @cell_2.place_ship(@cruiser)

    @cruiser.hit
    @cruiser.hit

    assert_equal false, @cruiser.sunk?

    @cruiser.hit

    assert_equal true, @cruiser.sunk?
    assert_equal "X", @cell_2.render
  end
end
