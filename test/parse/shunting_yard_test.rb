require 'minitest/autorun'
require_relative '../../lib/parse/shunting_yard'

class ShuntingYardTest < Minitest::Test
  def test_build_reverse_polish
    infix_function = '9 + 24 / ( 7 - 3 )'
    reverse_polish = %w(9 24 7 3 - / +)

    result = ShuntingYard.new.build_reverse_polish(infix_function)

    assert_equal reverse_polish, result
  end

end

class CalculateReversePolishTest < Minitest::Test
  def test_calculate_reverse_polish
    reverse_polish = %w(9 24 7 3 - / +)

    result = CalculateReversePolish.new.calculate_reverse_polish(reverse_polish)

    assert_equal 15, result
  end
end

class CalculatorTest < Minitest::Test
  def test_calculates
    infix_function = '9 + 24 / ( 7 - 3 )'

    result = Calculator.new.calculate(infix_function)

    assert_equal 15, result
  end
end
