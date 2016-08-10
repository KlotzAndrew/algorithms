class DepthFirstSearch
  def build_binary_array(connections, simple_nodes)
    empty_connections = build_empty_connections(simple_nodes.length)

    connections.each do |connection|
      base_index   = simple_nodes.index(connection[0])
      target_index = simple_nodes.index(connection[1])

      empty_connections[base_index][target_index] = 1
    end

    empty_connections
  end


  def traverse(binary_array, nodes, node)
    @result = []
    @stack = []

    search_nodes binary_array, nodes, node

    @result
  end

  private

  def search_nodes(binary_array, nodes, node)
    return if @result.include? node
    p "node here is +> #{node}"
    @result << node
    @stack << node
    p "result => #{@result}"
    p "stack => #{@stack}"

    adjacent_nodes  = find_adjacent_nodes binary_array, nodes, node
    p "adjacent_nodes => #{adjacent_nodes}"
    available_nodes = filter_unvisited_nodes adjacent_nodes

    p "available_nodes => #{available_nodes}"
    available_nodes.each do |available_node|
      search_nodes(binary_array, nodes, available_node)
    end

    @stack.pop
    p "stack after pop=> #{@stack}"

    @result
  end

  def filter_unvisited_nodes(adjacent_nodes)
    adjacent_nodes.delete_if {|node| @result.include? node }
  end

  def find_adjacent_nodes(binary_array, nodes, node)
    node_index       = nodes.index(node)
    node_connections = binary_array[node_index]

    adjacent_connections = []
    node_connections.each_with_index do |connection, index|
      adjacent_connections << nodes[index] if connection == 1
    end

    adjacent_connections
  end

  def build_empty_connections(length)
    empty_array = []
    length.times do
      empty_array << Array.new(length, 0)
    end

    empty_array
  end

end
