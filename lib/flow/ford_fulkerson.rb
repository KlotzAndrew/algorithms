class FordFulkerson
  def calculate_max_flow(network, start, target)
    @edge_to = []
    @flow    = 0
    @network = network

    while augmenting_path?(start, target)
      bottleneck = compute_bottleneck(start, target)
      add_flow_to_nodes(bottleneck, start, target)
      @flow += bottleneck
    end

    @flow
  end

  def add_flow_to_nodes(bottleneck, start, target)
    vertex = target
    until vertex == start
      @edge_to[vertex].add_residual_flow_to(vertex, bottleneck)
      vertex = @edge_to[vertex].other_edge(vertex)
    end
  end

  def compute_bottleneck(start, target)
    bottleneck = Float::INFINITY
    vertex = target
    until vertex == start
      bottleneck = new_bottleneck(bottleneck, vertex)
      vertex = @edge_to[vertex].other_edge(vertex)
    end

    bottleneck
  end

  def new_bottleneck(bottleneck, vertex)
    capacity = @edge_to[vertex].residual_capacity_to(vertex)
    bottleneck < capacity ? bottleneck : capacity
  end

  def augmenting_path?(start, target)
    @edge_to = Array.new(@network.list.size, nil)
    marked   = Array.new(@network.list.size, false)
    queue    = [start]

    while queue.any?
      vertex = queue.pop
      traverse_edges(queue, marked, vertex)
    end

    marked[target]
  end

  def traverse_edges(queue, marked, vertex)
    @network.list[vertex].each do |edge|
      destination = edge.other_edge(vertex)
      next unless recieve_capacity?(edge, destination, marked)

      marked[destination]   = true
      @edge_to[destination] = edge
      queue << destination
    end
  end

  def recieve_capacity?(edge, destination, marked)
    edge.residual_capacity_to(destination) > 0 && !marked[destination]
  end
end

class FlowEdge
  attr_accessor :from, :to, :capacity, :flow

  def initialize(from, to, capacity)
    @from     = from
    @to       = to
    @capacity = capacity
    @flow     = 0
  end

  def other_edge(vertex)
    vertex == from ? to : from
  end

  def residual_capacity_to(vertex)
    return flow if vertex == from
    return capacity - flow if vertex == to
  end

  def add_residual_flow_to(vertex, delta)
    self.flow -= delta if vertex == from
    self.flow += delta if vertex == to
  end
end

class FlowNetwork
  attr_reader :list

  def initialize(total_edges)
    @list = []
    total_edges.times { |_| @list << [] }
  end

  def add_edge(edge)
    @list[edge.from] << edge
    @list[edge.to] << edge
  end
end
