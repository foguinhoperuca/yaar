require 'minitest/autorun'
require 'yaarg'

class YaargTest < Minitest::Test
  def test_help
    assert_equal "Yet Another AdminLTE Ruby Gem!", Yaarg.help
  end
end
