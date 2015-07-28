require 'board'
class Ship
  def initialize
    @sizes = [1] # [2, 3, 4, 5] # bring back when more complicated
    @rotations = ["NS", "EW"]
    @hits = false
  end

  attr_reader :size, :rotation

  def sizes(size)
    fail 'That is not a valid selection' unless @sizes.include?(size)
    @size = size
  end

  def rotate(r)
    fail 'That is not a valid selection' unless @rotations.include?(r)
    @rotation = r
  end

  def hit
    @hits = true
  end

  def hit?
    @hits
  end

  def sunk?
    @hits == true
  end

end
