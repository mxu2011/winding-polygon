#A container class for segments (or edges) of the polygon to test
#Allows storage and retrieval from the Balanced Binary Tree
class Segment
  attr_reader :edge
  attr_accessor :left_point
  attr_accessor :right_point
  attr_accessor :above
  attr_accessor :below


  def initialize(event)
    @edge = event[:edge]
  end

  #required comparator for binary tree storage. Sort by y axis of the points where the segment crosses L (eg, the left point)
  def compare(other_segment)
    return 1 if @left_point.y > other_segment.left_point.y
    return -1 if @left_point.y < other_segment.left_point.y
    return 0
  end

  def <(other_segment)
    return true if @left_point.y < other_segment.left_point.y
    return true if @left_point.y == other_segment.left_point.y && @left_point.x < other_segment.left_point.x
    return false
  end

  def >(other_segment)
    return true if @left_point.y > other_segment.left_point.y
    return true if @left_point.y == other_segment.left_point.y && @left_point.x > other_segment.left_point.x
    return false
  end

  def == (other_segment)
    @edge == other_segment.edge && @left_point == other_segment.left_point && @right_point == other_segment.right_point
  end

  def to_s
    return "edge:#{@edge.to_s}"
  end

  def intersection_point_with(other_segment)
    numerator = (other_segment.left_point.y - @left_point.y) * (other_segment.left_point.x - other_segment.right_point.x) -
        (other_segment.left_point.y - other_segment.right_point.y) * (other_segment.left_point.x - @left_point.x)

    denominator = (@right_point.y - @left_point.y) * (other_segment.left_point.x - other_segment.right_point.x) -
        (other_segment.left_point.y - other_segment.right_point.y) * (@right_point.x - @left_point.x)

    t = numerator.to_f / denominator

    x = @left_point.x + t * (@right_point.x - @left_point.x)
    y = @left_point.y + t * (@right_point.y - @left_point.y)

    Point.new(x, y)
  end

end