class BubbleSort
  def call(arr)
    loop do
      swapped = false
      (arr.length-1).times do |i|
        if arr[i] > arr[i+1]
          swapped = true
          arr[i], arr[i+1] = arr[i+1], arr[i]
        end
      end

      break if !swapped
    end
    arr
  end
end
