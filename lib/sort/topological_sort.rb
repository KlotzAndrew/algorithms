class TopologicalSearch
  def traverse(graph)
    @stack = []
    @graph = graph

    @graph.each do |node|
      visit(node)
    end

    @stack.reverse
  end

  private

  def visit(node)
    return if node.visited
    node.visited = true
    node.edges.each do |edge|
      visit(@graph[edge])
    end

    @stack << node.value
  end
end

class GraphNode
  attr_accessor :value, :edges, :visited

  def initialize(value, edges = [])
    @value   = value
    @edges   = edges
    @visited = false
  end
end
