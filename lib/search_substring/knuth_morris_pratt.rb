class KnuthMorrisPratt
  def initialize(pattern)
    @pattern = pattern
    @dfa     = build_dfa
  end

  def search(string)
    state = 0

    string.chars.any? do |char|
      state = @dfa[char] ? @dfa[char][state] : 0
      state == @pattern.chars.length
    end
  end

  private

  def build_dfa
    dfa            = empty_dfa
    fallback_state = 0

    1.upto(@pattern.length - 1) do |state|
      copy_mismatch_case(dfa, state, fallback_state)
      set_match_case(dfa, state)
      fallback_state = next_fallback_state(dfa, state, fallback_state)
    end

    dfa
  end

  def next_fallback_state(dfa, state, fallback_state)
    dfa[@pattern[state]][fallback_state]
  end

  def set_match_case(dfa, state)
    dfa[@pattern[state]][state] = state + 1
  end

  def copy_mismatch_case(dfa, state, fallback_state)
    dfa.each_key { |char| dfa[char][state] = dfa[char][fallback_state] }
  end

  def initalize_start_values(dfa)
    dfa.each_key { |char| dfa[char][0] = 0 }
       .tap { |h| h[@pattern[0]][0] = 1 }
  end

  def empty_dfa
    states = @pattern.length
    chars  = @pattern.chars
    dfa    = chars.each_with_object({}) { |c, h| h[c] = Array.new(states) }

    initalize_start_values(dfa)
  end
end
