class Triangle
  class TriangleError < StandardError
  end

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
  end

  def kind
    if @sides.any? { |side| side <= 0 }
      raise TriangleError, "Triangle sides must be positive"
    elsif @sides.max >= @sides.reduce(:+) - @sides.max
      raise TriangleError, "Invalid triangle sides"
    elsif @sides.uniq.length == 1
      :equilateral
    elsif @sides.uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end
end
