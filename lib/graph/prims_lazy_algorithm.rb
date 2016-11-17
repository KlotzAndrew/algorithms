require 'set'

class PrimsLazyAlgorithm
  def initialize(graph)
    @graph = graph
    @mst = []
    @visited_nodes = Set.new []
    @pq = PriorityQueue.new
  end

  def solve
    @visited_nodes << @graph[:edges][0][:nodes][0]
    edges = get_connected_edges(@graph[:edges][0][:nodes][0])
    while @mst.count < @graph[:nodes].count - 1 do
      @pq.insert(edges)
      next_edge = get_next_edge
      next_node = add_to_mst(next_edge)
      edges = get_connected_edges(next_node)
    end
    @mst
  end

  def get_next_edge
    while !@pq.queue.empty? do
      popped_edge = @pq.next_edge
      edge_nodes = popped_edge[:nodes]
      return popped_edge if edge_nodes.any? { |edge_node| !@visited_nodes.include? edge_node }
    end
  end

  def add_to_mst(edge)
    @mst << edge[:id]
    node = (@visited_nodes.include? edge[:nodes][0]) ? 1 : 0
    @visited_nodes << edge[:nodes][0]
    @visited_nodes << edge[:nodes][1]
    return edge[:nodes][node]
  end

  def get_connected_edges(number)
    edges = []
    @graph[:edges].each do |edge|
      edges << edge if edge[:nodes].include? number
    end
    edges
  end
end

class PriorityQueue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def next_edge
    @queue.slice!(0)
  end

  def insert(edges)
    @queue << edges
    @queue.flatten!
    sort_queue
  end

  def sort_queue
    @queue.sort! { |edge_a, edge_b| edge_a[:weight] <=> edge_b[:weight] }
  end
end
