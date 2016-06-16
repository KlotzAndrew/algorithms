require "minitest/autorun"
require_relative '../bubblesort.rb'

class QuickSortTest < Minitest::Test
  def test_call_method
    assert_equal unsorted_array.sort,
                 BubbleSort.new.call(unsorted_array)
  end

  def test_swap_two
    my_array = [2,1]

    assert_equal my_array.sort,
                 BubbleSort.new.call(my_array)
  end

  def test_only_one
    my_array = [2]

    assert_equal my_array.sort,
                 BubbleSort.new.call(my_array)
  end

  def unsorted_array
    [80, 18, 54, 72, 38, 91, 36, 21, 3, 28, 12, 4, 57, 31]
  end
end
