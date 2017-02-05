class RedBlackTree
  def initialize
    @root = nil
  end

  def insert(value)
    root       = insert_node(value, @root)
    root.color = :black if root.red?

    @root = root
  end

  private

  def insert_node(value, node)
    return Node.new(value) if node.nil?

    if value < node.value
      node.left = insert_node(value, node.left)
    else
      node.right = insert_node(value, node.right)
    end

    enforce_rules(node)
  end

  def enforce_rules(node)
    node = node.rotate_left if node.rotate_left?
    node = node.rotate_right if node.rotate_right?
    node = node.flip_colors if node.flip_colors?

    node
  end
end

class Node
  attr_accessor :right, :left, :value, :color

  def initialize(value)
    @value  = value
    @color  = :red
  end

  def flip_colors
    self.color  = :red
    left.color  = :black
    right.color = :black

    self
  end

  def rotate_right?
    (left && left.red?) && (left.left && left.left.red?)
  end

  def rotate_left?
    (right && right.red?) && (!left || !left.red?)
  end

  def flip_colors?
    (left && left.red?) && (right && right.red?)
  end

  def rotate_left
    right_node      = right
    self.right      = right_node.left
    right_node.left = self

    finish_rotation(right_node)
  end

  def rotate_right
    left_node       = left
    self.left       = left_node.right
    left_node.right = self

    finish_rotation(left_node)
  end

  def red?
    color == :red
  end

  private

  def finish_rotation(rotated_node)
    rotated_node.color = color
    self.color         = :red

    rotated_node
  end
end
