class FordFulkerson
  def calculate_max_flow(flow_diagram)
    find_augmenting_path(flow_diagram.source_node, flow_diagram.sink_node)
    # Loop finding an augmenting path
      # Start at the source_node
      # Find a node connecting to it with either non-full forward or non-empty
      # backward flow
      # Add node to list of connected nodes
      # Add link to list of connected forward links or connected backward links
      # Find another node
      # If sink node is added, end
    # end Aug Path loop

    # Calculate bottleneck by looping over connected links
    # Whichever forward link has the most flow or backward has the least flow is
    # the bottleneck
    # Add bottleneck to each forward and subtract from each backward and find a
    # new augmenting path
#
    # return the amount of flow in every link to the sink, which should be 19
    # or just keep adding the bottleneck together
  end

  def find_augmenting_path(start_node, end_node)
    visited_nodes = [start_node]
    path = {
      backwards: [],
      forwards: []
    }
    augment_path(visited_nodes, path, start_node, end_node)
  end

  def augment_path(visited_nodes, current_node, end_node)
    return [] if current_node == end_node
    visited_nodes << current_node
    current_node.links.each do |link|
      if link_can_be_augmented(link, visited_nodes) #new method to check condition
        potential_path = augment_path(visited_nodes, destination_node, end_node)
        if potential_path.present?
          return add_link_to_path(potential_path, link)
        end
      end
    end
    return nil
  end

  def add_link_to_path(path, link)
    path.forwards << link #check if forwards or backwards
  end

  def destination_node(link, current_node)
    link.sink_node
  end

  def link_can_be_augmented(link)
    link.capacity > 0
  end
end

class NetworkFlowNode
  attr_accessor :id, :links

  def initialize(id)
    @id = id
  end
end

class NetworkFlowLink
  attr_reader :weight, :source_node, :sink_node, :flow

  def initialize(weight, source_node, sink_node, flow = 0)
    @capacity      = weight
    @flow          = flow
    @source_node   = source_node
    @sink_node     = sink_node
  end
end
