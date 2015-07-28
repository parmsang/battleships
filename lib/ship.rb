
class Ship
  def initialize
    @sizes = [1]#[2, 3, 4, 5] # bring back when more complicated
    @rotations = ['NS', 'EW']
  end

  attr_reader :size , :rotation

  def sizes(size)
    fail "That is not a valid selection" if !@sizes.include?(size)
    @size = size
  end

  def rotate(r)
    fail "That is not a valid selection" if !@rotations.include?(r)
    @rotation = r
  end

end
