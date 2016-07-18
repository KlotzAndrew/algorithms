require "minitest/autorun"
require_relative '../radix_sort.rb'

class RadixSortTest < Minitest::Test
  def test_call_method
    assert_equal unsorted_array.sort,
                 RadixSort.new.call(unsorted_array)
  end

  def unsorted_array
    [2342545, 2, 545, 897394, 33, 55555, 44444, 999999, 3432432, 454]
  end
end
