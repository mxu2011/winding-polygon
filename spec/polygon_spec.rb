require 'spec_helper'

describe "Polygon" do

  it 'test can build a polygon from an array of points' do

    points = JSON.parse("[[100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0]]")
    polygon = Polygon.new(points.map{|item| Point.new(item[0],item[1])})

    polygon.vertices.length.should == points.length
    polygon.vertices[0].x.should == points[0][0]

  end

  it 'test is polygon simple 1' do

    points = JSON.parse("[[100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.000001, 0.000001]]")
    polygon = Polygon.new(points.map{|item| Point.new(item[0],item[1])})

    polygon.is_simple.should == true

  end

end