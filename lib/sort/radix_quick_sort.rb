class RadixQuickSort
  def call(arr, low_index, high_index, digit_index = 0)
    if low_index < high_index
      wall_indexes = partition arr, low_index, high_index, digit_index

      call arr, wall_indexes[:low_wall], wall_indexes[:high_wall], digit_index + 1
      call arr, low_index, wall_indexes[:low_wall] - 1, digit_index
      call arr, wall_indexes[:high_wall] + 1, high_index, digit_index
    end

    arr
  end

  private

  def partition(unsorted_array, low_index, high_index, digit_index)
    pivot_value = unsorted_array[low_index][digit_index]
    low_wall    = low_index
    high_wall   = high_index

    current_index = low_index
    while low_wall < high_wall && current_index <= high_wall
      if unsorted_array[current_index][digit_index].nil? || unsorted_array[current_index][digit_index] < pivot_value
        swap_from_index(unsorted_array, current_index, low_wall)
        low_wall += 1
        current_index += 1
      elsif unsorted_array[current_index][digit_index] > pivot_value
        swap_from_index(unsorted_array, current_index, high_wall)
        high_wall -= 1
      elsif unsorted_array[current_index][digit_index] == pivot_value
        current_index += 1
      end
    end

    {
      low_wall:  low_wall,
      high_wall: high_wall
    }
  end

  def swap_from_index(array, index_1, index_2)
    array[index_1], array[index_2] = array[index_2], array[index_1]
  end
end
