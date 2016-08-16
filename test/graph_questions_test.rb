require 'minitest/autorun'
require_relative '../graph_questions.rb'
require_relative '../depth_first_search.rb'

class GraphQuestionsTest < Minitest::Test
  def test_node_is_connected
    graph_algorithm        = DepthFirstSearch
    graph_questions_object = GraphQuestions.new adjacency_list, graph_algorithm

    result = graph_questions_object.connected? 0, 4

    assert result
  end

  def test_node_is_not_connected
    graph_algorithm        = DepthFirstSearch
    graph_questions_object = GraphQuestions.new adjacency_list, graph_algorithm

    result = graph_questions_object.connected? 0, 2

    refute result
  end

  def test_find_path
    graph_algorithm        = DepthFirstSearch
    graph_questions_object = GraphQuestions.new adjacency_list, graph_algorithm

    result = graph_questions_object.find_path 0, 4

    expected_result = [0, 1, 4]

    assert_equal expected_result, result
  end

  def test_find_path_when_no_path
    graph_algorithm        = DepthFirstSearch
    graph_questions_object = GraphQuestions.new adjacency_list, graph_algorithm

    result = graph_questions_object.find_path 0, 2

    expected_result = []

    assert_equal expected_result, result
  end

  def test_find_path_same_node
    graph_algorithm        = DepthFirstSearch
    graph_questions_object = GraphQuestions.new adjacency_list, graph_algorithm

    result = graph_questions_object.find_path 0, 0

    expected_result = [0]

    assert_equal expected_result, result
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
end
