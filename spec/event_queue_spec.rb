require 'spec_helper'

describe "EventQueue" do

  it "test can create an EventQueue" do

    points = JSON.parse("[[100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0]]")
    polygon = Polygon.new(points.map{|item| Point.new(item[0],item[1])})
    event_queue = EventQueue.new(polygon)

    event_queue.events.length.should == 8
    event_queue.events.length.should == event_queue.number_of_events

  end
end