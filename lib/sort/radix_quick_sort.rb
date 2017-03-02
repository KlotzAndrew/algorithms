class RadixQuickSort
  def initialize(array)
    @array = array
  end

  def sort
    cycle(0, @array.length - 1)

    @array
  end

  def cycle(low_index, high_index, digit_index = 0)
    return unless low_index < high_index

    pivot     = partition(low_index, high_index, digit_index)
    low_wall  = pivot.low_wall
    high_wall = pivot.high_wall

    cycle(low_wall, high_wall, digit_index + 1)
    cycle(low_index, low_wall - 1, digit_index)
    cycle(high_wall + 1, high_index, digit_index)
  end

  private

  def partition(low_index, high_index, digit_index)
    pivot_value = @array[low_index][digit_index]

    pivot = Pivot.new(@array, low_index, high_index, digit_index, pivot_value)

    pivot.compare_wall while pivot.under_wall

    pivot
  end

  class Pivot
    attr_accessor :array, :low_wall, :high_wall, :current_index, :digit_index,
                  :pivot_value

    def initialize(array, low_wall, high_wall, digit_index, pivot_value)
      @array         = array
      @low_wall      = low_wall
      @high_wall     = high_wall
      @current_index = low_wall
      @digit_index   = digit_index
      @pivot_value   = pivot_value
    end

    def compare_wall
      if digit_under?
        handle_under
      elsif digit_over?
        handle_over
      elsif digit_equal?
        handle_equal
      end
    end

    def under_wall
      low_wall < high_wall && current_index <= high_wall
    end

    private

    def digit_under?
      digit.nil? || digit < @pivot_value
    end

    def handle_under
      swap_current_index(low_wall)
      self.low_wall += 1
      self.current_index += 1
    end

    def digit_over?
      digit > @pivot_value
    end

    def handle_over
      swap_current_index(high_wall)
      self.high_wall -= 1
    end

    def digit_equal?
      digit == @pivot_value
    end

    def handle_equal
      self.current_index += 1
    end

    def swap_current_index(target)
      @array[@current_index], @array[target] =
        @array[target], @array[@current_index]
    end

    def digit
      @array[@current_index][@digit_index]
    end
  end
end
