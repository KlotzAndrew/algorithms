require 'set'

class KruskalsAlgorithm
  def build(edges, nodes)
    sorted_edges = sort_by_weight(edges)
    @all_sets = make_sets(nodes)

    min_spanning_tree = []

    sorted_edges.each do |edge|
      left_set = find_set(edge[:nodes][0])
      right_set = find_set(edge[:nodes][1])

      if left_set != right_set
        left_set.merge(right_set)
        delete_set(right_set)

        min_spanning_tree << edge[:id]
      end
    end

    min_spanning_tree
  end

  private

  def delete_set(set)
    index = @all_sets.index(set)
    @all_sets.delete_at(index)
  end

  def find_set(node)
    @all_sets.find do |set|
      set.include?(node)
    end
  end

  def make_sets(nodes)
    nodes.map do |node|
      Set.new([node])
    end
  end

  def build_new_set(set, edge)
    new_set = Set.new set
    new_set.merge(edge[:nodes])
  end

  def sort_by_weight(edges)
    edges.sort_by do |edge|
      edge[:weight]
    end
  end
end
