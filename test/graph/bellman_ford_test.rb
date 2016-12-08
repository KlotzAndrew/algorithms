require 'minitest/autorun'
require_relative '../../lib/graph/bellman_ford'

class BellmanFordTest < Minitest::Test
  def test_traverse
    shortest_route = {
      0 => 0,
      1 => 5,
      2 => 5,
      3 => 7,
      4 => 9,
      5 => 8
    }

    result = BellmanFord.new.traverse(nodes)

    assert_equal shortest_route, result
  end

  private

  def nodes
    @node_0 = BellNode.new(0)
    @node_1 = BellNode.new(1)
    @node_2 = BellNode.new(2)
    @node_3 = BellNode.new(3)
    @node_4 = BellNode.new(4)
    @node_5 = BellNode.new(5)

    @node_0.links = [
      Link.new(10, @node_1),
      Link.new(8, @node_5)
    ]
    @node_1.links = [
      Link.new(2, @node_3)
    ]
    @node_2.links = [
      Link.new(1, @node_1)
    ]
    @node_3.links = [
      Link.new(-2, @node_2)
    ]
    @node_4.links = [
      Link.new(-4, @node_1),
      Link.new(-1, @node_3)
    ]
    @node_5.links = [
      Link.new(1, @node_4)
    ]

    [
      @node_0,
      @node_1,
      @node_2,
      @node_3,
      @node_4,
      @node_5
    ]
  end
end
