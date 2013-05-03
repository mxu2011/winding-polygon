class Point

  attr_reader :x
  attr_reader :y

  def initialize(x,y)
    @x=x
    @y=y
  end

  # Determines the xy lexicographical order of two points
  def compare other_point
    # x-coord first
    return  1 if (@x > other_point.x)
    return -1 if (@x < other_point.x)

    # y-coord second
    return  1 if (@y > other_point.y)
    return -1 if (@y < other_point.y)

    # they are the same point
    return 0;
  end

  # tests if point is Left|On|Right of the line P0 to P1.
  #
  # returns:
  #  >0 for left of the line
  #  0 for on the line
  #  <0 for right of the line
  def is_left p0, p1
    return (p1.x - p0.x) * (@y - p0.y) - (@x - p0.x) * (p1.y - p0.y)
  end

end