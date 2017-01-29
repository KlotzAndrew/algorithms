require 'minitest/autorun'
require_relative '../../lib/search_substring/rabin_karp'

class RabinKarpTest < Minitest::Test
  def test_search_substring
    pattern  = 'GTGGT'
    searcher = RabinKarp.new(pattern)

    assert_nil nil, searcher.search('aaaaa')
    assert_equal 8, searcher.search('GabcTGGTGTGGT')
  end
end
