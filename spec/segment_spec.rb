require 'spec_helper'

describe "Segment" do

  it "test_segments_intersect_at_the_endpoint" do

      segment1 = Segment.new({:edge=>0})
      segment1.left_point = Point.new(0,0)
      segment1.right_point = Point.new(2,2)

      segment2 = Segment.new({:edge=>1})
      segment2.left_point = Point.new(0,2)
      segment2.right_point = Point.new(2,2)

      intersection_point = segment1.intersection_point_with(segment2)
      intersection_point.x.should ==2
      intersection_point.y.should ==2

  end
end