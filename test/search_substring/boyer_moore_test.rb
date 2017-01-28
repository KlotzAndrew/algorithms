require 'minitest/autorun'
require_relative '../../lib/search_substring/boyer_moore'

class BoyerMooreTest < Minitest::Test
  def test_search_substring
    pattern  = 'GTGGT'
    searcher = BoyerMoore.new(pattern)

    refute searcher.search('aaaaa')
    assert searcher.search('GabcTGGTGTGGT')
  end
end
