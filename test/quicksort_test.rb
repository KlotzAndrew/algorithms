require "minitest/autorun"
require_relative '../quicksort.rb'

class QuickSortTest < Minitest::Test
  def test_call_method
    # [3, 4, 12, 18, 21, 28, 31, 36, 38, 54, 57, 72, 80, 91]
    assert_equal unsorted_array.sort, QuickSort.new.call(unsorted_array)
  end

  def unsorted_array
    # [80, 18, 54, 72, 38, 91, 36, 21, 3, 28, 12, 4, 57, 31]
    [80, 18, 54, 19]
  end
end
