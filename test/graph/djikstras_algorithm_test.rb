require 'minitest/autorun'
require_relative '../../lib/graph/djikstras_algorithm'

class DjikstrasAlgorithmTest < Minitest::Test
  def test_call_method
    starting = 4
    ending   = 7
    result   = DjikstrasAlgorithm.new.find_shortest_route adjacency_list, starting, ending

    assert_equal expected_result_for_0, result
  end

  def adjacency_list
    [
      {node: 0, edges: [{node: 1, weight: 1}, {node: 6, weight: 2}]},
      {node: 1, edges: [{node: 0, weight: 1}, {node: 4, weight: 2}]},
      {node: 2, edges: [{node: 6, weight: 5}, {node: 5, weight: 2}, {node: 7, weight: 3}]},
      {node: 3, edges: [{node: 6, weight: 1}, {node: 5, weight: 1}]},
      {node: 4, edges: [{node: 1, weight: 2}, {node: 6, weight: 6}]},
      {node: 5, edges: [{node: 3, weight: 1}, {node: 2, weight: 2}]},
      {node: 6, edges: [{node: 0, weight: 2}, {node: 4, weight: 6}, {node: 3, weight: 1}, {node: 2, weight: 5}]},
      {node: 7, edges: [{node: 2, weight: 3}]},
      {node: 8, edges: []}
    ]
  end

  def expected_result_for_0
    {
      route: [4,1,0,6,3,5,2,7],
      weight: 12
    }
  end
end
