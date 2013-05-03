class EventQueue

  def initialize(polygon)
    #last vertex in geojson is equal to first vertex
    @individual_vertices = polygon.vertices.length - 1
    #2 per edge - last event looping back to 0 is handled by +1 below
    @number_of_events =   2 * (individual_vertices)
    @events = []

    #build up 2 'events' per edge. One for left vertex, one for right.
    for i in 0..@individual_vertices

      a = 2*i
      b = 2*i+1
      @events[a] = {:edge=>i}
      @events[b] = {:edge=>i}
      @events[a][:vertex] = polygon.vertices[i]
      @events[b][:vertex] = polygon.vertices[i+1]
      if @events[a][:vertex].compare(@events[b][:vertex]) < 0
        @events[a][:type] = 'left'
        @events[b][:type] = 'right'
      else
        @events[a][:type] = 'right'
        @events[b][:type] = 'left'
      end
    end
  end

end