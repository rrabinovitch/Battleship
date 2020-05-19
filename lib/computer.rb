class Computer
  attr_reader :board,
              :cruiser,
              :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def cruiser_place

  end


  def submarine_place

  end
end
