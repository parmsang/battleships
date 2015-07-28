require_relative 'ship'
class Board


  def initialize(ships = 0)
    @board = []
  end
  
  attr_reader :board

  def place ship
    @board << ship
  end

end
