require 'minitest/autorun'
require_relative '../../lib/compression/huffman_coding'

class HuffmanCodingTest < Minitest::Test
  def test_encodes_and_decodes
    string = 'ABRACADABRA!'

    bytes  = '0111110010100100011111001011'
    key    = '01010000010010100010001010000111001000010101010010101000010'

    encoder = HuffmanCoding.new

    compressed = encoder.compress(string)

    assert_equal bytes, compressed[:bytes]
    assert_equal key, compressed[:key]

    origional = encoder.expand(compressed)

    assert_equal string, origional
  end
end
