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

  private

  def leaf?(node)
    node.left.nil? && node.right.nil?
  end

  def two_children?(node)
    node.left && node.right
  end

  def only_left_child?(node)
    node.left && node.right.nil?
  end

  def delete_root(root)
    return nil if leaf?(root)
    if two_children?(root)
      root.value = delete_two_children(root)
    elsif only_left_child?(root)
      root = root.left
    else # only has right child
      root = root.right
    end
    root
  end

  def delete_two_children(node)
    next_largest_value = search_min(node.right)
    delete(node, next_largest_value)
    next_largest_value
  end
end

Node = Struct.new(:left, :right, :value)
