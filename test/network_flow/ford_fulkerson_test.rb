require 'minitest/autorun'
require_relative '../../lib/network_flow/ford_fulkerson'

class FordFulkersonTest < Minitest::Test
  def test_max_flow
    expected_max_flow = 19

    result = FordFulkerson.new.calculate_max_flow(flow_diagram)

    assert_equal expected_max_flow, result
  end

  private

  def flow_diagram
    @node_s = NetworkFlowNode.new('S')
    @node_a = NetworkFlowNode.new('A')
    @node_b = NetworkFlowNode.new('B')
    @node_c = NetworkFlowNode.new('C')
    @node_d = NetworkFlowNode.new('D')
    @node_t = NetworkFlowNode.new('T')

    @link_s_a = NetworkFlowLink.new(10, @node_s, @node_a)
    @link_s_c = NetworkFlowLink.new(10, @node_s, @node_c)
    @link_a_c = NetworkFlowLink.new(2, @node_a, @node_c)
    @link_c_d = NetworkFlowLink.new(9, @node_c, @node_d)
    @link_a_d = NetworkFlowLink.new(8, @node_a, @node_d)
    @link_a_b = NetworkFlowLink.new(4, @node_a, @node_b)
    @link_d_b = NetworkFlowLink.new(6, @node_d, @node_b)
    @link_d_t = NetworkFlowLink.new(10, @node_d, @node_t)
    @link_b_t = NetworkFlowLink.new(10, @node_b, @node_t)

    @node_s.links = [
      @link_s_a,
      @link_s_c
    ]
    @node_a.links = [
      @link_s_a,
      @link_a_c,
      @link_a_d,
      @link_a_b
    ]
    @node_b.links = [
      @link_a_b,
      @link_d_b,
      @link_b_t
    ]
    @node_c.links = [
      @link_s_c,
      @link_a_c,
      @link_c_d
    ]
    @node_d.links = [
      @link_c_d,
      @link_a_d,
      @link_d_b,
      @link_d_t
    ]
    @node_t.links = [
      @link_b_t,
      @link_d_t
    ]

    {
      source_node: @node_s,
      sink_node: @node_t,
      nodes: [
        @node_a,
        @node_b,
        @node_c,
        @node_d,
        @node_s,
        @node_t,
      ]
    }
  end
end
