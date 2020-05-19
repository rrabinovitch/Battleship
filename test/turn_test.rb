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

    @turn = Turn.new(@human_board, @computer_board)

    @human_board.place(@human_cruiser, ["A1", "A2", "A3"])
    @human_board.place(@human_submarine, ["C1", "C2"])

    @computer_board.place(@computer_cruiser, ["B1", "B2", "B3"])
    @computer_board.place(@computer_submarine, ["D1", "D2"])
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_each_player_has_a_board
    assert_equal @human_board, @turn.human_board

    rendered_board = "  1 2 3 4 \n" +
                    "A . . . . \n" +
                    "B . . . . \n" +
                    "C . . . . \n" +
                    "D . . . . \n"

    assert_equal rendered_board, @turn.human_board.render
    assert_equal rendered_board, @turn.computer_board.render
  end

  def test_it_can_reveal_ship_placement_on_each_players_board
    human_rendered_board_revealed = "  1 2 3 4 \n" +
                                    "A S S S . \n" +
                                    "B . . . . \n" +
                                    "C S S . . \n" +
                                    "D . . . . \n"

    computer_rendered_board_revealed = "  1 2 3 4 \n" +
                                      "A . . . . \n" +
                                      "B S S S . \n" +
                                      "C . . . . \n" +
                                      "D S S . . \n"

    assert_equal human_rendered_board_revealed, @turn.human_board.render(true)
    assert_equal computer_rendered_board_revealed, @turn.computer_board.render(true)

  end

  def test_player_can_fire_at_an_empty_cell
    @turn.player_fires_at(@computer_board.cells["A4"].fire_upon)

    assert_equal true, @turn.computer_board.cells["A4"].fired_upon?
    assert_equal "M", @turn.computer_board.cells["A4"].render
  end

  def test_it_can_fire_at_a_cell_with_a_ship_and_affect_its_health
    @turn.player_fires_at(@human_board.cells["A1"].fire_upon)

    assert_equal true, @turn.human_board.cells["A1"].fired_upon?
    assert_equal false, @turn.human_board.cells["A1"].ship.sunk?
    assert_equal "H", @turn.human_board.cells["A1"].render
    assert_equal 2, @turn.human_board.cells["A1"].ship.health
  end

  def test_it_can_sink_a_ship
    @turn.player_fires_at(@computer_board.cells["D1"].fire_upon)
    assert_equal true, @turn.computer_board.cells["D1"].fired_upon?

    @turn.player_fires_at(@computer_board.cells["D2"].fire_upon)
    assert_equal true, @turn.computer_board.cells["D2"].fired_upon?

    assert_equal "X", @turn.computer_board.cells["D1"].render
    assert_equal "X", @turn.computer_board.cells["D2"].render

    assert_equal true, @turn.computer_board.cells["D1"].ship.sunk?
  end

  def test_it_can_identify_remaining_cells_on_each_board
    assert_equal
  end

  def test_it_has_a_result
    skip
  end
end
