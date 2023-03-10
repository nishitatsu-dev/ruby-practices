# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'test_value'
require_relative '../shot'

# 目次
# ①1投分の結果を、文字列のまま出力（ボーナス判定用）__mark
# ②1投分の結果を、全て数値に変換して出力（計算用）１〜３__score

class ShotTest < Minitest::Test
  def test_①1投分の結果を、文字列のまま出力（ボーナス判定用）__mark
    shot1 = '1'
    shot = Shot.new(shot1)
    assert_equal '1', shot.mark
  end

  def test_②1投分の結果を、全て数値に変換して出力（計算用）１__score
    shot_s = '1'
    shot = Shot.new(shot_s)
    assert_equal 1, shot.score
  end

  def test_②1投分の結果を、全て数値に変換して出力（計算用）２__score
    shot_s = 'X'
    shot = Shot.new(shot_s)
    assert_equal 10, shot.score
  end

  def test_②1投分の結果を、全て数値に変換して出力（計算用）３__score
    shot_s = 'dummy'
    shot = Shot.new(shot_s)
    assert_equal 0, shot.score
  end
end
