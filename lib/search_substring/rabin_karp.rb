class RabinKarp
  PRIME = 977
  RADIX = 256

  def initialize(pattern)
    @pattern = pattern
    @pattern_hash = calc_hash(pattern)
  end

  def search(string)
    text_hash = calc_hash(string[0..@pattern.size - 1])

    0.upto(string.size - @pattern.size) do |i|
      break i if text_hash == @pattern_hash
      break unless string[i + @pattern.length]

      text_hash = roll_hash(text_hash, string, i)
    end
  end

  private

  def roll_hash(text_hash, string, i)
    text_hash = remove_tail_char(text_hash, string[i])
    add_lead_char(text_hash, string[i + @pattern.size])
  end

  def remove_tail_char(text_hash, char)
    (text_hash - (char.ord * RADIX**(@pattern.size - 1))) % PRIME
  end

  def add_lead_char(text_hash, char)
    (text_hash * RADIX + char.ord) % PRIME
  end

  def calc_hash(string)
    string.chars.reduce(0) { |acc, c| (acc * RADIX + c.ord) % PRIME }
  end
end
