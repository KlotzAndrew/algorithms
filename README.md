# Algorithms

Ruby implementations of popular algorithms!

##### Flow
```ruby
# Ford Fulkerson

nodes       = 4
start_node  = 0
target_node = 3
edges       = [
  FlowEdge.new(0, 1, 10),
  FlowEdge.new(0, 2, 10),
  FlowEdge.new(2, 1, 9),
  FlowEdge.new(1, 3, 20)
]

network = FlowNetwork.new(total_nodes)
edges.each { |edge| network.add_edge(edge) }

FordFulkerson.new.calculate_max_flow(network, start_node, target_node) # 19
```

##### Graph
```ruby
# Bellman Ford

# TODO: add to readme
```

```ruby
# Breadth First Search

start_node     = 0
adjacency_list = [
  [1, 3],
  [0, 3],
  [1],
  [0, 1]
]

BreadthFirstSearch.new.traverse adjacency_list, start_node
# [
#   [true, nil],
#   [true, 0],
#   [false, nil],
#   [true, 0]
# ]
```

```ruby
# Depth First Search

start_node     = 0
adjacency_list = [
  [1, 3],
  [0, 3],
  [1],
  [0, 1]
]

DepthFirstSearch.new.traverse adjacency_list, start_node
# [
#   [true, nil],
#   [true, 0],
#   [false, nil],
#   [true, 1]
# ]
```

```ruby
# Djikstra's

starting       = 0
ending         = 3
adjacency_list = [
  {node: 0, edges: [{node: 1, weight: 1}, {node: 3, weight: 2}]},
  {node: 1, edges: [{node: 0, weight: 1}, {node: 3, weight: 1}]},
  {node: 2, edges: [{node: 1, weight: 1}]},
  {node: 3, edges: [{node: 0, weight: 1}, {node: 1, weight: 4}]}
]
DjikstrasAlgorithm.new.find_shortest_route adjacency_list, starting, ending
# {:weight=>2, :route=>[0, 1, 3]}
```

```ruby
# Kruskal's

nodes = [1, 2, 3, 4]
edges = [
  {id: 1, weight: 1, nodes: [1,3]},
  {id: 2, weight: 2, nodes: [1,2]},
  {id: 3, weight: 3, nodes: [3,2]},
  {id: 4, weight: 4, nodes: [2,4]}
]

KruskalsAlgorithm.new.build edges, nodes # [1, 2, 4]
```

```ruby
# Prim's
graph = { edges: [
  {id: 1, weight: 1, nodes: [1,3]},
  {id: 2, weight: 2, nodes: [1,2]},
  {id: 3, weight: 3, nodes: [3,2]},
  {id: 4, weight: 4, nodes: [2,4]}
  ], nodes: [0, 1, 2, 3]
}

PrimsLazyAlgorithm.new(graph).solve # [1, 2, 4]

```

##### Parse
```ruby
# Shunting Yard

infix_function = '9 + 24 / ( 7 - 3 )'
Calculator.new.calculate(infix_function) # 15
```

##### Search
```ruby
# Binary Search Tree

tree = BinarySearchTree.new.create [5, 10]

tree = BinarySearchTree.new.insert 15, tree
BinarySearchTree.new.search sorted_tree, 15 # true

tree = BinarySearchTree.new.delete 15, tree
BinarySearchTree.new.search sorted_tree, 15 # false
```

```ruby
# Red Black Tree

# TODO: add to readme
```

##### Sort
```ruby
# Bubble Sort

array = [3, 1, 2]
BubbleSort.new.call(array) # [1, 2, 3]
```

```ruby
# Heap Sort

array = [3, 1, 2]
HeapSort.new.call(array) # [1, 2, 3]
```

```ruby
# Insertion Sort

array = [3, 1, 2]
InsertionSort.new.call(array) # [1, 2, 3]
```

```ruby
# Merge Sort

array = [3, 1, 2]
MergeSort.new.call(array) # [1, 2, 3]
```

```ruby
# Quick Sort

array = [3, 1, 2]
QuickSort.new.call(array, 0, array.length - 1) # [1, 2, 3]
```

```ruby
# Radix Sort

array = ['bbz', 'ba', 'bc']
RadixQuickSort.new.call(array, 0, array.length - 1) # ['ba', 'bc', 'bbz']
```

```ruby
# Selection Sort

array = [3, 1, 2]
SelectionSort.new.call(array) # [1, 2, 3]
```

```ruby
# Shell Sort

array = [3, 1, 2]
ShellSort.new.call(array) # [1, 2, 3]
```

```ruby
# Topological Sort

graph = [
  GraphNode.new(0, [2]),
  GraphNode.new(2, [0]),
  GraphNode.new(1, [1])
]
TopologicalSearch.new.call(graph) # [1, 2, 3]
```

### Setup

```shell
git clone https://github.com/KlotzAndrew/algorithms.git algorithms
cd algorithms
rake test
```
