class GraphQuestions
  def initialize(adjacency_list, algorithm_search)
    @adjacency_list   = adjacency_list
    @algorithm_search = algorithm_search
  end

  def connected?(start, finish)
    traversed_graph = @algorithm_search.new.traverse @adjacency_list, start

    traversed_graph[finish][0]
  end

  def find_path(start_node, finish_node)
    traversed_graph = @algorithm_search.new.traverse @adjacency_list, start_node
    return [] unless traversed_graph[finish_node][0]

    edge_node = finish_node
    result    = [edge_node]
    until edge_node == start_node
      edge_node = traversed_graph[edge_node][1]
      result << edge_node
    end

    result.reverse
  end
end
