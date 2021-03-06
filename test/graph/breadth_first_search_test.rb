require 'minitest/autorun'
require_relative '../../lib/graph/breadth_first_search'

class BreadthFirstSearchTest < Minitest::Test
  def test_call_method
    result = BreadthFirstSearch.new.traverse adjacency_list, 0

    assert_equal expected_result_for_0, result
  end

  def adjacency_list
    [
      [1, 6],
      [0, 4],
      [5, 7],
      [5],
      [1, 6],
      [2,3],
      [0,4],
      [2]
    ]
  end

  def expected_result_for_0
    [
      [true, nil],
      [true, 0],
      [false, nil],
      [false, nil],
      [true, 1],
      [false, nil],
      [true, 0],
      [false, nil]
    ]
  end
end
