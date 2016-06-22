class SelectionSort
  def call(unsorted)
    sorted = []
    (unsorted.length).times do |v|
      index = 0
      largest = unsorted[index]
      unsorted.each_with_index do |j, i|
        if j > largest
          index = i
          largest = j
        end
      end
      unsorted.delete_at(index)
      sorted << largest
    end
    sorted
  end
end
