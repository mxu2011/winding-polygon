class SweepLine
  attr_reader :tree
  attr_reader :polygon

  def initialize(polygon)
    @tree    = RedBlackTree.new
    @polygon = polygon
  end

  # Add Algorithm 'event' (more like unit of analysis) to queue
  # Units are segments or distinct edges of the polygon.
  def add(event)
    # build up segment data
    var seg = Segment.new(event)
    p1 = @polygon.vertices[seg.edge]
    p2 = @polygon.vertices[seg.edge + 1]

    # if it is being added, then it must be a LEFT edge event
    # but need to determine which endpoint is the left one first

    if p1.compare(p2) < 0
      seg.left_point  = p1
      seg.right_point = p2
    else
      seg.left_point  = p2
      seg.right_point = p1
    end

    # Add node to tree and setup linkages to "above" and "below"
    # edges as per algorithm
    nd = @tree.add(seg)

    nx =
    np =

    if @tree.findNext(nd.value)
      seg.above = nx
      seg.above.below = seg
    end

    if @tree.findPrevious(nd.value)
      seg.below = np
      seg.below.above = seg
    end
    return seg

  end

  def find(event)
    # need a segment to find it in the tree
    seg = Segmen.new(evet)
    p1 = @polygon.vertices[seg.edge]
    p2 = @polygon.vertices[seg.edge + 1]

    # if it is being added, then it must be a LEFT edge event
    # but need to determine which endpoint is the left one first
    if p1.compare(p2) < 0
      seg.left_point  = p1
      seg.right_point = p2
    else
      seg.left_point  = p2
      seg.right_point = p1
    end

    @tree.find(seg)
  end

  def remove(seg)
    nd = @tree.find(seg)
    return if nd.nil?

    nx = @tree.findNext(nd)
    nx.below = seg.below if !nx.nil?

    np = @tree.findPrevious(nd)
    np.above = seg.above if !np.nil?

    @tree.remove(seg)
  end

  #test intersect of 2 segments and return: false=none, true=intersect
  def intersect(s1,s2)
    # no intersect if either segment doesn't existend
    return false if s1.nil? || s2.nil?

    # check for consecutive edges in polygon
    e1 = s1.edge
    e2 = s2.edge

    # no non-simple intersect since consecutive
    return false if (((e1+1)%@polygon.vertices.length === e2) || (e1 === (e2+1)%@polygon.vertices.length))


    #test for existence of an intersect point
    #s2 left point sign
    lsign = s2.left_point.is_left(s1.left_point, s1.right_point)
    #s2 right point sign
    rsign = s2.right_point.is_left(s1.left_point, s1.right_point)

    # s2 endpoints have same sign relative to s1  => on same side => no intersect is possible
    return false if (lsign * rsign > 0)

    # s1 left point sign
    lsign = s1.left_point.is_left(s2.left_point, s2.right_point)
    #s1 right point sign
    rsign = s1.right_point.is_left(s2.left_point, s2.right_point)

    # s1 endpoints have same sign relative to s2 => on same side => no intersect is possible
    return false  if (lsign * rsign > 0)

    #segments s1 and s2 straddle. Intersect exists.
    return true
  end
end