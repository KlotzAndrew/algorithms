require 'minitest/autorun'
require_relative '../../lib/sort/topological_sort'

class TopologicalSortTest < Minitest::Test
  def test_call_method
    result = TopologicalSearch.new.traverse graph

    assert_equal expected_result_for_0, result
  end

  def graph
    [
      GraphNode.new(0, [1, 2, 5]),
      GraphNode.new(1, [4]),
      GraphNode.new(2),
      GraphNode.new(3, [2, 4, 5, 6]),
      GraphNode.new(4, []),
      GraphNode.new(5, [2]),
      GraphNode.new(6, [0, 4])
    ]
  end

  def expected_result_for_0
    [3, 6, 0, 5, 2, 1, 4]
  end
end
