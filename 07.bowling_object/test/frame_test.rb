# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'test_value'
require_relative '../frame'

# 目次
# ①投球結果（文字列）から、１ショット目（数値）を出力__first_shot
# ②投球結果（文字列）から、ショット合計値（数値）を出力__score
# ③投球結果（文字列）から、ストライクの場合:Xを出力する__mark
# ④投球結果（文字列）から、スペアの場合:spareを出力する__mark
# ⑤投球結果（文字列）から、ストライク・スペア以外の場合:noneを出力する__mark

class FrameTest < Minitest::Test
  def test_①投球結果（文字列）から、１ショット目（数値）を出力__first_shot
    first_shot = '1'
    second_shot = '2'
    frame = Frame.new(first_shot, second_shot)
    assert_equal 1, frame.first_shot_score
  end

  def test_②投球結果（文字列）から、ショット合計値（数値）を出力__score
    first_shot = '1'
    second_shot = '2'
    frame = Frame.new(first_shot, second_shot)
    assert_equal 3, frame.score
  end

  def test_③投球結果（文字列）から、ストライクの場合：Xを出力する__mark
    first_shot = 'X'
    second_shot = 'dummy'
    frame = Frame.new(first_shot, second_shot)
    assert_equal :X, frame.mark
  end

  def test_④投球結果（文字列）から、スペアの場合：spareを出力する__mark
    first_shot = '3'
    second_shot = '7'
    frame = Frame.new(first_shot, second_shot)
    assert_equal :spare, frame.mark
  end

  def test_⑤投球結果（文字列）から、ストライク・スペア以外の場合：noneを出力する__mark
    first_shot = '3'
    second_shot = '6'
    frame = Frame.new(first_shot, second_shot)
    assert_equal :none, frame.mark
  end
end
