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

  def to_s
    return "edge:#{@edge.to_s}"
  end

end