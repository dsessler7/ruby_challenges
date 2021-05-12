class Triangle
  attr_reader :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    sides = [side_a, side_b, side_c].sort
    if sides.any? { |side| side <= 0 } || (sides[0] + sides[1] < sides[2])
      raise ArgumentError
    end

    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end

  def kind
    if side_a == side_b && side_b == side_c
      'equilateral'
    elsif (side_a == side_b && side_b != side_c) || 
          (side_a == side_c && side_c != side_b) ||
          (side_b == side_c && side_c != side_a)
      'isosceles'
    else
      'scalene'
    end
  end
end
