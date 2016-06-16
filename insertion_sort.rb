class InsertionSort
  def call(arr)
    sorted_array = []
    (arr.length).times do |i|
      value = arr.pop
      new_index = 0
      sorted_array.each_with_index do |sorted_value, j|
        if sorted_value < value
          new_index+=1
        end
      end
      sorted_array.insert(new_index, value)
    end
    sorted_array
  end
end
