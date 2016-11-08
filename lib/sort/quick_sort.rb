class QuickSort
  def call(arr, low_index, high_index)
    if low_index < high_index
      pivot = partition arr, low_index, high_index

      call arr, low_index, pivot - 1
      call arr, pivot + 1, high_index
    end

    arr
  end

  private

  def partition(unsorted_array, low_index, high_index)
    pivot_value = unsorted_array[high_index]
    wall_index  = low_index

    wall_index.upto(high_index - 1) do |current_index|
      if unsorted_array[current_index] <= pivot_value
        unsorted_array[current_index], unsorted_array[wall_index] = unsorted_array[wall_index], unsorted_array[current_index]
        wall_index += 1
      end
    end
    unsorted_array[wall_index], unsorted_array[high_index] = unsorted_array[high_index], unsorted_array[wall_index]

    wall_index
  end
end
