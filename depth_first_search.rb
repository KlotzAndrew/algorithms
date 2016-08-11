class DepthFirstSearch
  def traverse(adjacency_list, node)
    @result = []
    @stack = []
    @traversed_graph = []
    adjacency_list.length.times do
      @traversed_graph << [false, nil]
    end

    search_nodes adjacency_list, node

    @traversed_graph
  end

  private

  def search_nodes(adjacency_list, node)
    return if @result.include? node
    @traversed_graph[node][0] = true
    @traversed_graph[node][1] = @stack.last

    @result << node
    @stack << node

    adjacent_nodes  = find_adjacent_nodes adjacency_list, node
    available_nodes = filter_unvisited_nodes adjacent_nodes

    available_nodes.each do |available_node|
      search_nodes(adjacency_list, available_node)
    end

    @stack.pop

    @result
  end

  def filter_unvisited_nodes(adjacent_nodes)
    adjacent_nodes.delete_if {|node| @result.include? node }
  end

  def find_adjacent_nodes(adjacency_list, node)
    adjacency_list[node]
  end
end
