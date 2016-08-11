require 'minitest/autorun'
require_relative '../depth_first_search.rb'

class DepthFirstSearchTest < Minitest::Test
  def test_call_method
    result = DepthFirstSearch.new.traverse adjacency_list, 0

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
      [true, 4],
      [false, nil]
    ]
  end
end
