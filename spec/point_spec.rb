require 'rspec'
require 'spec_helper'

describe "Point" do

  it 'test less than comparator' do
    p0 = Point.new(1,1)
    p1 = Point.new(3,3)
    p0.compare(p1).should == -1
  end

  it 'test more than comparator' do
    p0 = Point.new(1,1)
    p1 = Point.new(3,3)
    p1.compare(p0).should == 1
  end

  it 'test equality' do
    p0 = Point.new(1,1)
    p0.compare(p0).should == 0
  end

  it 'test left of line' do
    p0 = Point.new(1,1)
    p1 = Point.new(3,3)
    p2 = Point.new(1,3)
    p2.is_left(p0,p1).should > 0
  end

  it 'test right of line' do
    p0 = Point.new(1,1)
    p1 = Point.new(3,3)
    p2 = Point.new(3,1)
    p2.is_left(p0,p1).should < 0
  end

  it 'test on of line' do
    p0 = Point.new(1,1)
    p1 = Point.new(3,3)
    p2 = Point.new(2,2)
    p2.is_left(p0,p1).should == 0
  end

end