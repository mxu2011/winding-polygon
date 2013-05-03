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

end