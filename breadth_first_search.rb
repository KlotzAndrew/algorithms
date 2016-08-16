class BreadthFirstSearch
  def traverse(adjacency_list, node)
    @result = []
    @queue   = []
    @traversed_graph = []
    adjacency_list.length.times do
      @traversed_graph << [false, nil]
    end

    search_nodes adjacency_list, node

    @traversed_graph
  end

  private

  def search_nodes(adjacency_list, node)
    @traversed_graph[node][0] = true

    @result << node

    adjacent_nodes  = find_adjacent_nodes adjacency_list, node
    available_nodes = filter_unvisited_nodes adjacent_nodes
    available_nodes.each do |n|
      @queue << n
      @result << n
      @traversed_graph[n][0] = true
      @traversed_graph[n][1] = node
    end

    until @queue.empty?
      next_node = @queue.shift
      search_nodes adjacency_list, next_node
    end
  end

  def filter_unvisited_nodes(adjacent_nodes)
    adjacent_nodes.delete_if {|node| @result.include? node }
  end

  def find_adjacent_nodes(adjacency_list, node)
    adjacency_list[node]
  end
end
