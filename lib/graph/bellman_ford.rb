class BellmanFord
  def traverse(nodes)
    @table = set_table(nodes)

    Array.new(nodes.length - 1) do
      nodes.each do |node|
        next if @table[node.id].nil?

        node.links.each do |link|
          current_weight = @table[link.node.id]
          new_weight     = @table[node.id] + link.weight

          if current_weight == nil || new_weight < current_weight
            @table[link.node.id] = new_weight
          end
        end
      end
    end

    @table
  end

  private

  def set_table(nodes)
    table = nodes.each_with_object({}) do |node, hash|
      hash[node.id] = nil
    end
    table[nodes.first.id] = 0
    table
  end
end

class BellNode
  attr_accessor :id, :links

  def initialize(id)
    @id = id
  end
end

class Link
  attr_reader :weight, :node

  def initialize(weight, node)
    @weight = weight
    @node   = node
  end
end
