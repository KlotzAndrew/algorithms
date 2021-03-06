require 'minitest/autorun'
require_relative '../../lib/graph/prims_lazy_algorithm'

class PrimsLazyAlgorithmTest < Minitest::Test
  def test_call_method
    prims = PrimsLazyAlgorithm.new graph
    result = prims.solve

    expected_result = [1, 3, 4, 2, 5, 9, 13]

    assert_equal expected_result, result
  end

  def graph
    { edges: [
      {id: 1, weight: 0.16, nodes: [0,7]},
      {id: 2, weight: 0.17, nodes: [2,3]},
      {id: 3, weight: 0.19, nodes: [1,7]},
      {id: 4, weight: 0.26, nodes: [0,2]},
      {id: 5, weight: 0.28, nodes: [5,7]},
      {id: 6, weight: 0.29, nodes: [1,3]},
      {id: 7, weight: 0.32, nodes: [1,5]},
      {id: 8, weight: 0.34, nodes: [2,7]},
      {id: 9, weight: 0.35, nodes: [4,5]},
      {id: 10, weight: 0.36, nodes: [1,2]},
      {id: 11, weight: 0.37, nodes: [4,7]},
      {id: 12, weight: 0.38, nodes: [0,4]},
      {id: 13, weight: 0.40, nodes: [6,2]},
      ], nodes: [0, 1, 2, 3, 4, 5, 6, 7]
    }
  end
end
