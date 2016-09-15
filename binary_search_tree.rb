class BinarySearchTree
  def create(unsorted_array)
    @root = insert(unsorted_array.shift, nil)

    unsorted_array.each do |number|
      insert(number, @root)
    end

    @root
  end

  def insert(number, parent_node)
    if parent_node.nil?
      parent_node = Node.new(number)
    elsif number < parent_node.value
      parent_node.left = insert(number, parent_node.left)
    elsif number >= parent_node.value
      parent_node.right = insert(number, parent_node.right)
    end
    parent_node
  end

  def search(node, value)
    return nil if node.nil?
    return node if node.value == value
    if value < node.value
      search(node.left, value)
    elsif value > node.value
      search(node.right, value)
    end
  end

  def search_min(node)
    return node.value if node.left.nil?
    search_min(node.left)
  end

  def search_max(node)
    return node.value if node.right.nil?
    search_max(node.right)
  end

  def has_children?(node)
    node.left || node.right
  end

  def leaf?(node)
    node.left.nil? && node.right.nil?
  end

  def has_two_children?(node)
    node.left && node.right
  end

  def has_only_left_child?(node)
    node.left && node.right.nil?
  end

  def delete_root(root)
    if leaf?(root)
      return nil
    elsif has_two_children?(root)
      next_largest_value = search_min(root.right)
      delete(root, next_largest_value)
      root.value = next_largest_value
    elsif has_only_left_child?(root)
      root = root.left
    else # only has right child
      root = root.right
    end
    root
  end


  def delete(root, value)
    if root.value == value
      root = delete_root(root)
    elsif root.value < value
      root.right = delete(root.right, value)
    elsif root.value > value
      root.left = delete(root.left, value)
    end

    root
  end
end

class Node
  attr_accessor :right, :left, :value # can add more data later

  def initialize(value)
    @value = value
  end
end
