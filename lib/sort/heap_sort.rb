class HeapSort
  def call(unsorted)
    heap = heapify(unsorted)

    sort_heap(heap)
  end

  private

  def sort_heap(heap)
    sorted_array = []

    heap.length.times do
      sorted_array.unshift heap.shift
      heap.unshift heap.pop

      sift_down(heap, 0)
    end

    sorted_array
  end

  def heapify(unsorted)
    index = parent_index(unsorted.length - 1)

    index.downto(0) do |parent_index|
      sift_down(unsorted, parent_index)
    end

    unsorted
  end

  def sift_down(heap, index)
    swap_index = find_swap_index(heap, index)
    return if swap_index == index

    heap[swap_index], heap[index] = heap[index], heap[swap_index]
    sift_down(heap, swap_index)
  end

  def find_swap_index(heap, index)
    left  = left_child(index)
    right = right_child(index)
    largest_child = find_largest_child(heap, left, right)

    largest_child && heap[largest_child] > heap[index] ? largest_child : index
  end

  def find_largest_child(heap, left, right)
    return nil unless heap[left] || heap[right]
    return left unless heap[right]
    return right unless heap[left]

    heap[left] > heap[right] ? left : right
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
