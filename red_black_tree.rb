class RedBlackTree
  def insert(number, root)
    root = insert_node(number, root)
    root.color = :black if node_red?(root)

    root
  end

  private

  def insert_node(number, node)
    if node.nil?
      return Node.new(number)
    elsif number < node.value
      node.left = insert_node(number, node.left)
    elsif number >= node.value
      node.right = insert_node(number, node.right)
    end

    node = rotate_left(node) if node_red?(node.right) && !node_red?(node.left)
    node = rotate_right(node) if node_red?(node.left) && node_red?(node.left.left)
    node = flip_colors(node) if node_red?(node.left) && node_red?(node.right)

    node
  end

  def flip_colors(node)
    node.color = :red
    node.left.color = :black
    node.right.color = :black

    node
  end

  def rotate_right(node)
    left_node = node.left

    node.left = left_node.right
    left_node.right = node
    left_node.color = node.color
    node.color = :red

    left_node
  end

  def rotate_left(node)
    right_node = node.right

    node.right = right_node.left
    right_node.left = node
    right_node.color = node.color
    node.color = :red

    right_node
  end

  def node_red?(node)
    return false unless node
    node.color == :red
  end
end

class Node
  attr_accessor :right, :left, :value, :color

  def initialize(value)
    @value  = value
    @color  = :red
  end
end
