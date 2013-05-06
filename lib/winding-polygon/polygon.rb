class Polygon
  attr_reader :vertices

  def initialize(points)
    @vertices = points
  end

  def is_simple
    event_queue  = EventQueue.new(self)
    sweep_line   = SweepLine.new(self)

    # This loop processes all events in the sorted queue
    # Events are only left or right vertices
    e = event_queue.events.shift
    while !e.nil? do

      if e.type == 'left'
        s = sweep_line.add(e)
        return false  if sweep_line.intersect(s, s.above)
        return false  if sweep_line.intersect(s, s.below)
      else
        s = sweep_line.find(e)
        return false if sweep_line.intersect(s.above, s.below)
        sweep_line.remove(s)
      end

      e = event_queue.events.shift
    end

    return true
  end
end