class HeapSort
  def call(unsorted)
    heaped_array = heapify unsorted

    sort_heap heaped_array
  end

  def sort_heap(heaped_array)
    sorted_array = []

    heaped_array.length.times do
      sorted_array.unshift heaped_array.shift
      heaped_array.unshift heaped_array.pop

      sift_down(heaped_array, 0)
    end

    sorted_array
  end

  def heapify(unsorted)
    start_index = parent_index(unsorted.length - 1)

    start_index.downto(0) do |parent_index|
      sift_down(unsorted, parent_index)
    end

    unsorted
  end

  def sift_down(unsorted, start_index)
    left_index  = left_child_index(start_index)
    right_index = right_child_index(start_index)
    swap_index  = start_index

    swap_index = left_index if swap_smaller? unsorted[swap_index], unsorted[left_index]
    swap_index = right_index if swap_smaller? unsorted[swap_index], unsorted[right_index]

    if swap_index != start_index
      unsorted[swap_index], unsorted[start_index] = unsorted[start_index], unsorted[swap_index]
      sift_down(unsorted, swap_index)
    end
  end

  def swap_smaller?(swap, new_value)
    return false if new_value.nil?
    return true if swap < new_value
  end

  def parent_index(index)
    ((index - 1) / 2).floor
  end

  def left_child_index(index)
    index * 2 + 1
  end

  def right_child_index(index)
    index * 2 + 2
  end
end
