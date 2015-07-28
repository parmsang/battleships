require_relative 'ship'
class Board
  def initialize(_ships = 0)
    @board_size = [10,10]
    @board = [[]]
  end

  attr_reader :board

  def place(ship, x, y)
    fail "Placement is outside board coordiantes" if (1 > x || x > @board_size[0]) || (1 > y || y > @board_size[1])
    fail "Ship exists at that location!" if @board[y-1][x-1] != nil
    @board[y-1][x-1] = ship
  end
end
