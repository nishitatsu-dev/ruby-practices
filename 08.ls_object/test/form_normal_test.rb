# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../form_normal'

# 目次
#  ノーマル表示__initialize

class FormNormalTest < Minitest::Test
  def test_ノーマル表示__initialize
    files = ['1.rb', '2_abc.rb', '3_defg.txt', '4_hijk.md', '5_lmn.rb']
    form_normal = FormNormal.new(files)
    expected = ['1.rb          3_defg.txt    5_lmn.rb      ', '2_abc.rb      4_hijk.md     ']
    assert_equal expected, form_normal.lines
  end
end
