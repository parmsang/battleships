require_relative 'ship'
class Board
  def initialize(_ships = 0)
    @board_size = [10,10]
    @board = Array.new(@board_size[1]) { Array.new(@board_size[0]) }
    @fired = Array.new(@board_size[1]) { Array.new(@board_size[0]) {false} }
  end

  attr_reader :board, :fired

  def place(ship, x, y)
    fail "Placement is outside board coordiantes" if (1 > x || x > @board_size[0]) || (1 > y || y > @board_size[1])
    fail "Ship exists at that location!" if board[y-1][x-1] != nil
    board[y-1][x-1] = ship
  end

  def fire(x,y)
  	fail "You fired outside board coordiantes" if (1 > x || x > @board_size[0]) || (1 > y || y > @board_size[1])
    fail "You have already fired at this location" if fired[y-1][x-1] == true
    fired[y-1][x-1] = true
  end
end