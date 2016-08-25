class DjikstrasAlgorithm
  def find_shortest_route(adjacency_list, starting, ending)
    @adjacency_list = adjacency_list
    @observed_nodes = []
    @result_list = adjacency_list.map do |list|
      {
        node: list[:node],
        weight: nil,
        route: []
      }
    end

    @result_list[starting][:weight] ||= 0

    traverse starting, ending

    {
      weight: @result_list[ending][:weight],
      route: @result_list[ending][:route]
    }
  end

  private

  def traverse(starting, ending)
    @result_list[starting][:route] << starting
    return if starting == ending

    node_edges = @adjacency_list[starting][:edges]
    node_edges.each do |edge|
      node_number = edge[:node]
      new_weight  = edge[:weight].nil? ? @result_list[starting][:weight] : edge[:weight] + @result_list[starting][:weight]

      if @result_list[node_number][:weight].nil? || new_weight < @result_list[node_number][:weight]
        @result_list[node_number][:weight] = new_weight
        @result_list[node_number][:route]  = @result_list[starting][:route]
      end
    end
    @observed_nodes << starting

    next_node = find_next_node
    return unless next_node

    traverse(next_node[:node], ending) if next_node[:node]
  end

  def find_next_node
    weighted_results = @result_list.reject { |node| node[:weight].nil? || @observed_nodes.include?(node[:node])}
    weighted_results.reduce {|memo, node| memo[:weight] < node[:weight] ? memo : node}
  end
end
