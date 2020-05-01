require 'test/unit'
require_relative './get_pairs'

class GetPairsTest < Test::Unit::TestCase
  def test_get_pairs
    assert_equal([[3, 2], [5, 0]], get_pairs([22, 3, 5, 0, 2, 2]))
    assert_equal([[-5, 10], [2, 3], [2, 3], [5, 0]], get_pairs([-5, 33, 2, 2, 3, 5, 0, 10, 3]))
    assert_equal([[5, 0], [5, 0], [5, 0]], get_pairs([5, 5, 5, 0, 0, 0, 5]))
    assert_equal([[3, 3], [6, 0]], get_pairs([3, 3, 6, 0], 6))
  end
end
