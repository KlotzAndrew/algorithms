class Calculator
  def calculate(infix_function)
    reverse_polish = ShuntingYard.new.build_reverse_polish(infix_function)
    CalculateReversePolish.new.calculate_reverse_polish(reverse_polish)
  end
end

class CalculateReversePolish
  def calculate_reverse_polish(reverse_polish)
    @stack = []

    reverse_polish.each do |token|
      if number?(token)
        @stack << token
      elsif operator?(token)
        first_number  = @stack.pop
        second_number = @stack.pop

        @stack << calculate(first_number, second_number, token)
      end
    end

    @stack.first
  end

  private

  def calculate(first_number, second_number, token)
    second_number.to_i.send(token, first_number.to_i)
  end

  def number?(token)
    token =~ /^\d+$/
  end

  def operator?(token)
    operators.include?(token)
  end

  def operators
    {
      '^' => 5,
      '/' => 4,
      '*' => 3,
      '+' => 2,
      '-' => 1,
    }
  end
end

class ShuntingYard
  def build_reverse_polish(infix_function)
    split_list = infix_function.split(' ')

    @operator_stack = []
    @output_queue   = []

    split_list.each do |token|
      if number?(token)
        @output_queue << token
      elsif operator?(token)
        move_greater_operators_to_queue(token)
      elsif left_bracket?(token)
        @operator_stack << token
      elsif right_bracket?(token)
        move_inside_bracket_to_queue
      end
    end

    move_all_operators_to_output

    @output_queue
  end

  private

  def move_inside_bracket_to_queue
    while operator_stack_not_left_bracket?
      @output_queue << @operator_stack.pop
    end
    @operator_stack.pop
  end

  def move_greater_operators_to_queue(token)
    while operator_stack_greater_precedence?(token)
      @output_queue << @operator_stack.pop
    end
    @operator_stack << token
  end

  def operator_stack_not_left_bracket?
    !left_bracket?(@operator_stack.last)
  end

  def move_all_operators_to_output
    until @operator_stack.empty?
      @output_queue << @operator_stack.pop
    end
  end

  def left_bracket?(token)
    token == '('
  end

  def right_bracket?(token)
    token == ')'
  end

  def operator_stack_greater_precedence?(token)
    return false unless precedence(@operator_stack.last)
    precedence(@operator_stack.last) >= precedence(token)
  end

  def number?(token)
    token =~ /^\d+$/
  end

  def operator?(token)
    operators.include?(token)
  end

  def precedence(token)
    operators[token]
  end

  def operators
    {
      '^' => 5,
      '/' => 4,
      '*' => 3,
      '+' => 2,
      '-' => 1,
    }
  end
end
