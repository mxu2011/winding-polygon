class SweepLine
  attr_reader :tree
  attr_reader :polygon

  def initialize(polygon)
    @tree    = AVLTree.new
    @polygon = polygon
  end

  def add(event)
    # build up segment data
    seg = Segment.new(event)
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
    nd = @tree.insert(seg)

    nx = nd.next
    np = nd.prev

    if !nx.nil?
      seg.above = nx.value
      seg.above.below = seg
    end

    if !np.nil?
      seg.below = np.value
      seg.below.above = seg
    end
    return seg

  end

  def find(event)
    # need a segment to find it in the tree
    seg = Segment.new(event)
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

    @tree.search(seg)
  end

  def remove(seg)
    nd = @tree.search(seg)
    return if nd.nil?

    nx = nd.next
    nx.value.below = seg.below if !nx.nil?

    np = nd.prev
    np.value.above = seg.above if !np.nil?

    @tree.delete(seg)
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