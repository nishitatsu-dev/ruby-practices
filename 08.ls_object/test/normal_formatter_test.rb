# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../normal_formatter'

# 目次
#  ノーマル表示__initialize

class NormalFormatterTest < Minitest::Test
  def test_ノーマル表示__initialize
    files = ['1.rb', '2_abc.rb', '3_defg.txt', '4_hijk.md', '5_lmn.rb']
    normal_format = NormalFormatter.new(files)
    expected = ['1.rb          3_defg.txt    5_lmn.rb      ', '2_abc.rb      4_hijk.md     ']
    assert_equal expected, normal_format.lines
  end
end
