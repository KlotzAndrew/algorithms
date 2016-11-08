class MergeSort
  def call(arr)
    return arr if arr.length == 1

    length = arr.length
    half = (length / 2).floor

    left  = arr[0..half - 1]
    right = arr[half..length - 1]

    sorted_left  = call(left)
    sorted_right = call(right)

    result = []
    while !sorted_left.empty? && !sorted_right.empty?
      result << if sorted_left[0] < sorted_right[0]
                  sorted_left.shift
                else
                  sorted_right.shift
                end
    end

    result.concat sorted_left
    result.concat sorted_right
  end
end
