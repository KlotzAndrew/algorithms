require 'minitest/autorun'
require_relative '../../lib/search_substring/knuth_morris_pratt'

class KnuthMorrisPrattTest < Minitest::Test
  def test_search_substring
    pattern  = 'ABABAC'
    searcher = KnuthMorrisPratt.new(pattern)

    assert searcher.search('ABABAAABCABABAC')
    refute searcher.search('AAAAAA')
    refute searcher.search('XYZ')
  end
end
