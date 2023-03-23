# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'test_value'
require_relative '../frame'
require_relative '../game'

# 目次
# ①投球結果（文字列など）から、ショット合計値（数値）を出力１〜２__score

class FrameTest < Minitest::Test
  def test_①投球結果（文字列など）から、ショット合計値（数値）を出力１__score
    frame = Frame.new('1', '2')
    assert_equal 3, frame.score
  end

  def test_①投球結果（文字列など）から、ショット合計値（数値）を出力２__score
    frame = Frame.new('X', nil)
    assert_equal 10, frame.score
  end
end
