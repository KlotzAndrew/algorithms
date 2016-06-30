class ShellSort
  GAPS = [701, 301, 132, 57, 23, 10, 4, 1]

  def call(unsorted)
    GAPS.each do |gap|
      next if unsorted[gap].nil?
      index = gap

      while index < unsorted.length
        gap_step = index
        current_element = unsorted[index]

        while gap_step >= gap
          new_element = unsorted[gap_step - gap]
          break if new_element > current_element
          unsorted[gap_step] = new_element
          gap_step -= gap
        end
        unsorted[gap_step] = current_element

        index += 1
      end
    end
    unsorted
  end
end
