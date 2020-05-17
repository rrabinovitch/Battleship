require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Hash, @board.cells
    assert_instance_of Cell, @board.cells.values.first
    assert_instance_of Board, @board
  end

  def test_it_has_cells
    assert_equal 16, @board.cells.count
    assert_instance_of Cell, @board.cells["A1"]
  end

  def test_it_can_validate_presence_of_coordinate_on_board
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")

    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_it_evaluates_congruence_between_ship_length_and_number_of_coordinates
    assert_equal true, @board.coordinates_and_ship_length_same_num?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.coordinates_and_ship_length_same_num?(@submarine, ["A2", "A3"])

    assert_equal false, @board.coordinates_and_ship_length_same_num?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.coordinates_and_ship_length_same_num?(@submarine, ["A2", "A3", "A4"])
  end

  def test_it_can_split_coordinates
    assert_equal [["A", "1"], ["A", "2"], ["A", "3"]], @board.split_coordinates(["A1", "A2", "A3"])
  end

  def test_it_can_identify_rows_of_a_set_of_coordinates
    assert_equal ["A", "A", "A"], @board.coordinate_rows(["A1", "A2", "A3"])
    assert_equal ["A", "B", "C"], @board.coordinate_rows(["A1", "B1", "C1"])
  end

  def test_it_can_identify_whether_coordinates_are_in_same_row
    assert_equal true, @board.coordinates_in_same_row?(["A1", "A2", "A3"])
    assert_equal true, @board.coordinates_in_same_row?(["A3", "A2", "A1"])

    assert_equal false, @board.coordinates_in_same_row?(["A1", "B1", "C1"])
  end

  def test_it_can_identify_columns_of_a_set_of_coordinates
    assert_equal [1, 2, 3], @board.coordinate_columns(["A1", "A2", "A3"])
    assert_equal [1, 1, 1], @board.coordinate_columns(["A1", "B1", "C1"])
    assert_equal [3, 2, 1], @board.coordinate_columns(["A3", "A2", "A1"])
  end

  def test_it_can_identify_whether_coordinates_are_in_same_column
    assert_equal true, @board.coordinates_in_same_column?(["A1", "B1", "C1"])
    assert_equal true, @board.coordinates_in_same_row?(["A3", "A2", "A1"])

    assert_equal false, @board.coordinates_in_same_column?(["A1", "A2", "A3"])
  end

  def test_it_can_identify_whether_coordinates_are_in_consecutive_rows
    assert_equal true, @board.coordinates_in_consecutive_rows?(["A1", "B1", "C1"])

    assert_equal false, @board.coordinates_in_consecutive_rows?(["A1", "A2", "A3"])
    assert_equal false, @board.coordinates_in_consecutive_rows?(["A3", "A2", "A1"])
  end

  def test_it_can_identify_whether_coordinates_are_in_consecutive_columns
    assert_equal true, @board.coordinates_in_consecutive_columns?(["A1", "A2", "A3"])

    assert_equal false, @board.coordinates_in_consecutive_columns?(["A1", "B1", "C1"])
    assert_equal false, @board.coordinates_in_consecutive_columns?(["A3", "A2", "A1"])
  end

  def test_it_can_identify_whether_coordinates_are_consecutive
    assert_equal true, @board.coordinates_consecutive?(["A1", "A2", "A3"])
    assert_equal true, @board.coordinates_consecutive?(["A1", "B1", "C1"])

    assert_equal false, @board.coordinates_consecutive?(["A1", "A2", "A4"])
    assert_equal false, @board.coordinates_consecutive?(["A1", "C1"])
    assert_equal false, @board.coordinates_consecutive?(["A3", "A2", "A1"])
    assert_equal false, @board.coordinates_consecutive?(["C1", "B1"])
  end

  def test_coordinates_must_be_same_length_as_ship
    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.valid_placement?(@submarine, ["A2", "A3"])

    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_coordinates_must_be_consecutive
    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "B1", "C1"])
    assert_equal true, @board.valid_placement?(@submarine, ["C1", "D1"])
    assert_equal true, @board.valid_placement?(@submarine, ["D1", "D2"])

    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
  end

  def test_coordinates_cant_be_diagonal
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_it_can_use_all_criteria_to_validate_placement
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_ships_occupy_multiple_cells
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    assert_equal @cruiser, cell_1.ship
    assert_equal @cruiser, cell_2.ship
    assert_equal @cruiser, cell_3.ship
    assert cell_1.ship == cell_2.ship
  end

  def test_if_all_cells_are_empty
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.cell_has_no_ships?(["B2", "B3", "B4"])
    assert_equal false, @board.cell_has_no_ships?(["A1","A2","A3"])
  end

  def test_ships_do_not_overlap
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.place(@submarine, ["A1", "A2"])

    assert_equal @cruiser, cell_1.ship
    assert_equal @cruiser, cell_2.ship
    assert_equal @cruiser, cell_3.ship
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
  end

  def test_it_can_render_default
    default_board = "  1 2 3 4 \n" +
                    "A . . . . \n" +
                    "B . . . . \n" +
                    "C . . . . \n" +
                    "D . . . . \n"

    assert_equal default_board, @board.render
  end

  def test_it_can_render_reveal_ship_without_being_hit
    @board.place(@cruiser, ["A1", "A2", "A3"])

    revealed_board = "  1 2 3 4 \n" +
                    "A S S S . \n" +
                    "B . . . . \n" +
                    "C . . . . \n" +
                    "D . . . . \n"

    assert_equal revealed_board, @board.render(true)
  end

  def test_it_can_render_hits_and_misses

    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.cells["A1"].fire_upon
    @board.cells["B1"].fire_upon

    fired_at_board = "  1 2 3 4 \n" +
                    "A H . . . \n" +
                    "B M . . . \n" +
                    "C . . . . \n" +
                    "D . . . . \n"

    assert_equal fired_at_board, @board.render
  end

  def test_it_can_render_sunken_ships
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.cells["A1"].fire_upon
    @board.cells["B1"].fire_upon
    @board.cells["A2"].fire_upon
    @board.cells["A3"].fire_upon

    sunken_ship_board =  "  1 2 3 4 \n" +
                        "A X X X . \n" +
                        "B M . . . \n" +
                        "C . . . . \n" +
                        "D . . . . \n"

    assert_equal sunken_ship_board, @board.render
  end
end
