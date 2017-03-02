require 'minitest/autorun'
require_relative '../../lib/sort/radix_quick_sort'

class RadixQuickSortTest < Minitest::Test
  def test_sorts_strings
    assert_equal small_strings.sort,
                 RadixQuickSort.new(small_strings).sort
  end

  def test_sorts_larger_strings
    assert_equal large_strings.sort,
                 RadixQuickSort.new(large_strings).sort
  end

  def small_strings
    %w(bbz ba bc ac ab aaz cc c cbzo ifjh aaiojon aaioahoe c cb)
  end

  def large_strings
    %w(ul okysf owoqiozhnymdf zbqdtwtwvtn wzzf rvbcqnbnz tozchqvd adxgtaj
       rdba r '')
  end
end
