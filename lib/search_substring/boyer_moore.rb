class BoyerMoore
  def initialize(pattern)
    @pattern        = pattern
    @bad_char_table = build_char_table
    @suffix_table   = build_suffix_table
  end

  def search(string)
    skip = 0
    string_index = @pattern.length - 1
    match = false

    while string_index <= string.length
      string_index += skip
      skip = 0

      skip = search_skip_value(string, string_index)

      break match = true if skip.zero?
    end
    match
  end

  private

  def search_skip_value(string, string_index)
    skip = 0
    (@pattern.size - 1).downto(0) do |pattern_index|
      next string_index -= 1 if @pattern[pattern_index] == string[string_index]

      last_match_pat_index = pattern_index + 1
      break skip = new_skip_value(last_match_pat_index)
    end
    skip
  end

  def new_skip_value(pattern_index)
    skip_table_char = @pattern[pattern_index]
    bad_char_skip = @bad_char_table[skip_table_char] || @pattern.length

    suffix_skip = @suffix_table[@pattern.size - 1 - pattern_index]
    suffix_skip > bad_char_skip ? suffix_skip : bad_char_skip
  end

  def build_suffix_table
    table = []
    (@pattern.length - 1).downto(0) do |pattern_index|
      test_pat = @pattern[pattern_index..(@pattern.length - 1)]
      table << suffix_skip(test_pat)
    end
    table
  end

  def suffix_skip(test_pat)
    (@pattern.size - 2).downto(0) do |suffix_index|
      shift_value = (@pattern.size - 1) - suffix_index
      pattern_start = suffix_index - (test_pat.length - 1)

      break @pattern.length if pattern_start < 0
      break shift_value if test_pat == @pattern[pattern_start..suffix_index]
    end
  end

  def build_char_table
    @pattern.chars.each_with_object({}) do |char, hash|
      hash[char] ||= skip_value(char)
    end
  end

  def skip_value(char)
    (@pattern.length - 2).downto(0) do |c|
      break (@pattern.length - 1 - c) if @pattern[c] == char
    end
  end
end
