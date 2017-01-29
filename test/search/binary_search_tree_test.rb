require 'minitest/autorun'
require_relative '../../lib/search/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  def test_create_method
    unordered_numbers = [10, 30, 4, 6, 15]

    sorted_node = BinarySearchTree.new.create unordered_numbers

    assert_equal 10, sorted_node.value
    assert_equal 4, sorted_node.left.value
    assert_equal 30, sorted_node.right.value
  end

  def test_insert
    sorted_tree = BinarySearchTree.new.create [5, 10]
    updated_tree = BinarySearchTree.new.insert 15, sorted_tree

    assert_nil updated_tree.left
    assert_equal 10, updated_tree.right.value
    assert_equal 15, updated_tree.right.right.value
  end

  def test_search
    sorted_tree = BinarySearchTree.new.create [10, 30, 4, 6, 15]

    result = BinarySearchTree.new.search sorted_tree, 15
    assert result

    result = BinarySearchTree.new.search sorted_tree, 99
    refute result
  end

  def test_search_min
    sorted_node = BinarySearchTree.new.create [10, 30, 4, 6, 15]

    result = BinarySearchTree.new.search_min sorted_node
    assert_equal 4, result
  end

  def test_search_max
    sorted_node = BinarySearchTree.new.create [10, 30, 4, 6, 15]

    result = BinarySearchTree.new.search_max sorted_node
    assert_equal 30, result
  end

  def test_delete_with_no_children
    sorted_node = BinarySearchTree.new.create [10, 30, 4, 6, 15]

    result = BinarySearchTree.new.delete sorted_node, 6
    assert_nil result.left.right

    result = BinarySearchTree.new.delete sorted_node, 15
    assert_nil result.right.left
  end

  def test_delete_with_one_child
    sorted_node = BinarySearchTree.new.create [10, 30, 15, 4, 3, 8, 5, 9, 2]

    result = BinarySearchTree.new.delete sorted_node, 30
    assert_equal 15, result.right.value

    result = BinarySearchTree.new.delete sorted_node, 3
    assert_equal 2, result.left.left.value
  end

  def test_delete_root
    sorted_node = BinarySearchTree.new.create [99]

    result = BinarySearchTree.new.delete sorted_node, 99
    assert_nil result
  end

  def test_delete_root_one_child
    sorted_node = BinarySearchTree.new.create [99, 90]

    result = BinarySearchTree.new.delete sorted_node, 99
    assert_equal 90, result.value
  end

  def test_delete_root_two_child
    sorted_node = BinarySearchTree.new.create [99, 90, 130]

    result = BinarySearchTree.new.delete sorted_node, 99
    assert_equal 130, result.value
  end

  def test_delete_with_two_children
    sorted_node = BinarySearchTree.new.create [10, 30, 15, 4, 3, 8, 5, 9, 2]

    result = BinarySearchTree.new.delete sorted_node, 4
    assert_equal 5, result.left.value

    result = BinarySearchTree.new.delete sorted_node, 10
    assert_equal 15, result.value
  end
end
