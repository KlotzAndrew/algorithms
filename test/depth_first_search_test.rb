require 'minitest/autorun'
require_relative '../depth_first_search.rb'

class DepthFirstSearchTest < Minitest::Test
  def test_call_method
    binary_array = DepthFirstSearch.new.build_binary_array listed_edges, nodes
    binary_array.each do |a|
      p a
    end
    # assert_equal expected_listed_edges, binary_array


    expected_result = %w(a b e g f c h d)
    # expected_result = %w(a b c)
    result = DepthFirstSearch.new.traverse binary_array, nodes, nodes.last

    assert_equal expected_result, result
  end

  def small_listed_edges
    [
      %w(a b),
      %w(b a),
      %w(b c),
      %w(c b)
    ]
  end

  def small_nodes
    %w(a b c)
  end

  def nodes
    %w(a b c d e f g h)
  end

  def expected_listed_edges
    [
      [0, 1, 0, 1, 0, 0, 1, 0],
      [1, 0, 0, 0, 1, 1, 0, 0],
      [0, 0, 0, 0, 0, 1, 0, 1],
      [1, 0, 0, 0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0, 0, 1, 0],
      [0, 1, 1, 1, 0, 0, 0, 0],
      [1, 0, 0, 0, 1, 0, 0, 0],
      [0, 0, 1, 0, 0, 0, 0, 0]
    ]
  end

  def listed_edges
    [
      %w(a b),
      %w(a d),
      %w(a g),
      %w(b a),
      %w(b e),
      %w(b f),
      %w(c f),
      %w(c h),
      %w(d a),
      %w(d f),
      %w(e b),
      %w(e g),
      %w(f b),
      %w(f c),
      %w(f d),
      %w(g a),
      %w(g e),
      %w(h c)
    ]
  end
end
