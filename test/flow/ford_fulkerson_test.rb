require 'minitest/autorun'
require_relative '../../lib/flow/ford_fulkerson'

class FordFulkersonTest < Minitest::Test
  def test_max_flow
    max_flow = 19
    start    = 0
    target   = 5
    network  = setup_network

    result = FordFulkerson.new.calculate_max_flow(network, start, target)

    assert_equal max_flow, result
  end

  private

  def setup_network
    total_nodes = 6
    edges       = all_edges

    network = FlowNetwork.new(total_nodes)
    edges.each { |edge| network.add_edge(edge) }
    network
  end

  def all_edges
    [FlowEdge.new(0, 1, 10),
     FlowEdge.new(0, 3, 10),
     FlowEdge.new(1, 3, 2),
     FlowEdge.new(1, 4, 8),
     FlowEdge.new(1, 2, 4),
     FlowEdge.new(2, 5, 10),
     FlowEdge.new(3, 4, 9),
     FlowEdge.new(4, 2, 6),
     FlowEdge.new(4, 5, 10)]
  end
end
