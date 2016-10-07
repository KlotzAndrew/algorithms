require 'minitest/autorun'
require_relative '../red_black_tree.rb'

class RedBlackTreeTest < Minitest::Test
  def test_insert_node_rotate_left
    result = RedBlackTree.new.insert 's', nil
    result = RedBlackTree.new.insert 'e', result
    result = RedBlackTree.new.insert 'a', result

    assert_equal 'e', result.value
    assert_equal :black, result.color

    assert_equal 'a', result.left.value
    assert_equal :black, result.left.color

    assert_equal 's', result.right.value
    assert_equal :black, result.right.color
  end

  def test_insert_node
    result = RedBlackTree.new.insert 's', nil
    result = RedBlackTree.new.insert 'e', result
    result = RedBlackTree.new.insert 'a', result
    result = RedBlackTree.new.insert 'r', result
    result = RedBlackTree.new.insert 'c', result
    result = RedBlackTree.new.insert 'h', result

    assert_equal 'r', result.value
    assert_equal :black, result.color

    assert_equal 's', result.right.value
    assert_equal :black, result.right.color

    assert_equal 'e', result.left.value
    assert_equal :red, result.left.color

    assert_equal 'h', result.left.right.value
    assert_equal :black, result.left.right.color

    assert_equal 'c', result.left.left.value
    assert_equal :black, result.left.left.color

    assert_equal 'a', result.left.left.left.value
    assert_equal :red, result.left.left.left.color
  end
end
