class HuffmanCoding
  def compress(string)
    trie       = build_trie(string)
    code_table = build_code_table(trie)
    bytes      = string.chars.each_with_object('') { |c, s| s << code_table[c] }

    {
      bytes: bytes,
      key:   write_trie(trie)
    }
  end

  def expand(compressed)
    key   = compressed[:key]
    root  = read_trie(key)
    bytes = compressed[:bytes]

    result = ''
    until bytes.empty?
      node = root
      node = bytes.slice!(0) == '0' ? node.left : node.right until node.leaf?
      result << node.char
    end

    result
  end

  private

  def read_trie(bytes)
    if bytes.slice!(0) == '1'
      char = [bytes.slice!(0, 8)].pack('B*')
      return Node.new(char, 0)
    end
    x = read_trie(bytes)
    y = read_trie(bytes)

    Node.new(nil, 0, x, y)
  end

  def write_trie(node, key = '')
    if node.leaf?
      key << '1'
      return key << node.char.unpack('B*')[0]
    end
    key << '0'
    write_trie(node.left, key) if node.left
    write_trie(node.right, key) if node.right
  end

  def build_code_table(node, path = '', code_table = {})
    code_table[node.char] = path if node.char

    build_code_table(node.left, path + '0', code_table) if node.left
    build_code_table(node.right, path + '1', code_table) if node.right

    code_table
  end

  def build_trie(string)
    frequencies = calc_frequencies(string)
    queue       = setup_queue(frequencies)

    while queue.size > 1
      x = queue.delete_min
      y = queue.delete_min

      parent = Node.new(nil, x.freq + y.freq, x, y)
      queue.insert(parent)
    end

    queue.delete_min
  end

  def setup_queue(frequencies)
    frequencies.each_with_object(PriorityQueue.new) do |(k, v), queue|
      node = Node.new(k, v)
      queue.insert(node)
    end
  end

  def calc_frequencies(string)
    string.chars.each_with_object({}) do |char, h|
      h[char] = h[char] ? h[char] + 1 : 1
    end
  end

  class Node
    attr_reader :freq, :char, :left, :right

    def initialize(char, freq, left = nil, right = nil)
      @char  = char
      @freq  = freq
      @left  = left
      @right = right
    end

    def leaf?
      !left && !right
    end

    def compare_freq(node)
      freq - node.freq
    end
  end

  class PriorityQueue
    def initialize
      @heap = []
    end

    def size
      @heap.size
    end

    def insert(node)
      @heap << node
      bubble_up
    end

    def delete_min
      node = @heap.shift
      @heap.unshift @heap.pop unless @heap.empty?
      sift_down(0)

      node
    end

    private

    def sift_down(index)
      swap_index = find_swap_index(index)
      return if swap_index == index

      @heap[swap_index], @heap[index] = @heap[index], @heap[swap_index]
      sift_down(swap_index)
    end

    def find_swap_index(index)
      left  = left_child(index)
      right = right_child(index)
      child = find_smallest_child(left, right)

      child && @heap[child].freq < @heap[index].freq ? child : index
    end

    def find_smallest_child(left, right)
      return nil unless @heap[left] || @heap[right]
      return left unless @heap[right]
      return right unless @heap[left]

      @heap[left].freq < @heap[right].freq ? left : right
    end

    def bubble_up
      total_nodes = parent_index(@heap.size - 1)
      total_nodes.downto(0) { |index| sift_down(index) }
    end

    def parent_index(index)
      ((index - 1) / 2).floor
    end

    def left_child(index)
      index * 2 + 1
    end

    def right_child(index)
      index * 2 + 2
    end
  end
end
