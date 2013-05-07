require 'spec_helper'

describe "SweepLine" do

  it "test can find" do
    points = JSON.parse("[[100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0]]")
    polygon = Polygon.new(points.map{|item| Point.new(item[0],item[1])})
    sweep_line = SweepLine.new(polygon)
    event_queue = EventQueue.new(polygon)

    event = event_queue.events.pop
    while !event.nil?
        sweep_line.add(event) if event[:type]=='left'
        event = event_queue.events.pop
    end

    for i in 0..3  do
      sweep_line.find({:edge=>i}).should_not be_nil
    end

  end
end