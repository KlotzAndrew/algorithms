require 'minitest/autorun'
require_relative '../../lib/sort/radix_quick_sort'

class RadixQuickSortTest < Minitest::Test
  def test_call_method
    assert_equal unsorted_array.sort,
                 RadixQuickSort.new.call(unsorted_array, 0, unsorted_array.length-1)
  end

  def test_with_anoter_stirng_2
    assert_equal unsorted_array_2.sort,
                 RadixQuickSort.new.call(unsorted_array_2, 0, unsorted_array_2.length-1)
  end

  def unsorted_array
    ['bbz', 'ba', 'bc', 'ac', 'ab', 'aaz', 'cc', 'c', 'cbzo', 'ifjh', 'aaiojon', 'aaioahoe', 'c', 'cb']
  end

  def unsorted_array_2
    ['ul', 'okysf', 'owoqiozhnymdf', 'zbqdtwtwvtn', 'wzzf', 'rvbcqnbnz', 'tozchqvd', 'adxgtaj', 'rdba', 'r', '']
  end
end
