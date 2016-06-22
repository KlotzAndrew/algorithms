require "minitest/autorun"
require_relative '../selection_sort.rb'

class SelectionSortTest < Minitest::Test
  def test_call_method
    assert_equal unsorted_array.sort.reverse,
                 SelectionSort.new.call(unsorted_array)
  end

  def unsorted_array
    [80, 18, 54, 72, 38, 91, 36, 21, 3, 28, 12, 4, 57, 31]
  end
end
