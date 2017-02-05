require 'minitest/autorun'
require_relative '../../lib/search/red_black_tree'

class RedBlackTreeTest < Minitest::Test
  def test_insert_node
    string = 'searc'
    tree = RedBlackTree.new

    string.chars.each { |c| tree.insert(c) }
    result = tree.insert 'h'

    assert_r(result)
    assert_s(result)
    assert_e(result)
    assert_h(result)
    assert_c(result)
    assert_a(result)
  end

  private

  def assert_r(result)
    assert_equal 'r', result.value
    assert_equal :black, result.color
  end

  def assert_s(result)
    assert_equal 's', result.right.value
    assert_equal :black, result.right.color
  end

  def assert_e(result)
    assert_equal 'e', result.left.value
    assert_equal :red, result.left.color
  end

  def assert_h(result)
    assert_equal 'h', result.left.right.value
    assert_equal :black, result.left.right.color
  end

  def assert_c(result)
    assert_equal 'c', result.left.left.value
    assert_equal :black, result.left.left.color
  end

  def assert_a(result)
    assert_equal 'a', result.left.left.left.value
    assert_equal :red, result.left.left.left.color
  end
end
