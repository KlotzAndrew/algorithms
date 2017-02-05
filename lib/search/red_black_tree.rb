class RedBlackTree
  def initialize
    @root = nil
  end

  def insert(value)
    root       = insert_node(value, @root)
    root.color = :black if red?(root)

    @root = root
  end

  private

  def insert_node(value, node)
    return Node.new(value) if node.nil?

    if value < node.value
      node.left = insert_node(value, node.left)
    elsif value >= node.value
      node.right = insert_node(value, node.right)
    end

    enforce_rules(node)
  end

  def enforce_rules(node)
    node = rotate_left(node) if rotate_left?(node)
    node = rotate_right(node) if rotate_right?(node)
    node = flip_colors(node) if flip_colors?(node)

    node
  end

  def rotate_left?(node)
    red?(node.right) && !red?(node.left)
  end

  def rotate_right?(node)
    red?(node.left) && red?(node.left.left)
  end

  def flip_colors?(node)
    red?(node.left) && red?(node.right)
  end

  def flip_colors(node)
    node.color       = :red
    node.left.color  = :black
    node.right.color = :black

    node
  end

  def rotate_right(node)
    left_node = node.left

    node.left       = left_node.right
    left_node.right = node
    left_node.color = node.color
    node.color      = :red

    left_node
  end

  def rotate_left(node)
    right_node = node.right

    node.right       = right_node.left
    right_node.left  = node
    right_node.color = node.color
    node.color       = :red

    right_node
  end

  def red?(node)
    node && node.color == :red
  end
end

class Node
  attr_accessor :right, :left, :value, :color

  def initialize(value)
    @value  = value
    @color  = :red
  end
end
