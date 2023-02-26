# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'test_value'
require_relative '../frame'

# 目次
# ①投球結果（X有り）を分割（「仮想10フレームまで」と「仮想11フレーム以降」）１〜４__initialize
# ②投球結果（数値のみ）を分割（「仮想10フレームまで」と「仮想11フレーム以降」）１〜４__initialize
# ③各フレームのボーナス種類を判定できる配列を返す１〜４__subtotal_each_frame
# 注：
# 「仮想10フレームまで」とは、「各フレーム２投ずつ合計20要素まで」のこと。
# 10フレームでのボーナス投球は、「仮想11フレーム以降」に入ると考える。

class FrameTest < Minitest::Test
  def test_①投球結果（X有り）を分割（「仮想10フレームまで」と「仮想11フレーム以降」）１__initialize
    argv = TestValue.argv1
    shot = Shot.new(argv)
    test_frame = Frame.new(shot)
    frames = TestValue.frames_x1[0..19]
    assert_equal frames, test_frame.frames_x_upto10
  end

  def test_①投球結果（X有り）を分割（「仮想10フレームまで」と「仮想11フレーム以降」）２__initialize
    argv = TestValue.argv2
    shot = Shot.new(argv)
    test_frame = Frame.new(shot)
    frames = TestValue.frames_x2[0..19]
    assert_equal frames, test_frame.frames_x_upto10
  end

  def test_①投球結果（X有り）を分割（「仮想10フレームまで」と「仮想11フレーム以降」）３__initialize
    argv = TestValue.argv3
    shot = Shot.new(argv)
    test_frame = Frame.new(shot)
    frames = TestValue.frames_x3[0..19]
    assert_equal frames, test_frame.frames_x_upto10
  end

  def test_①投球結果（X有り）を分割（「仮想10フレームまで」と「仮想11フレーム以降」）４__initialize
    argv = TestValue.argv4
    shot = Shot.new(argv)
    test_frame = Frame.new(shot)
    frames = TestValue.frames_x4[0..19]
    assert_equal frames, test_frame.frames_x_upto10
  end

  def test_②投球結果（数値のみ）を分割（「仮想10フレームまで」と「仮想11フレーム以降」）１__initialize
    argv = TestValue.argv1
    shot = Shot.new(argv)
    test_frame = Frame.new(shot)
    frames = TestValue.frames_i1[0..19]
    assert_equal frames, test_frame.frames_i_upto10
  end

  def test_②投球結果（数値のみ）を分割（「仮想10フレームまで」と「仮想11フレーム以降」）２__initialize
    argv = TestValue.argv2
    shot = Shot.new(argv)
    test_frame = Frame.new(shot)
    frames = TestValue.frames_i2[0..19]
    assert_equal frames, test_frame.frames_i_upto10
  end

  def test_②投球結果（数値のみ）を分割（「仮想10フレームまで」と「仮想11フレーム以降」）３__initialize
    argv = TestValue.argv3
    shot = Shot.new(argv)
    test_frame = Frame.new(shot)
    frames = TestValue.frames_i3[0..19]
    assert_equal frames, test_frame.frames_i_upto10
  end

  def test_②投球結果（数値のみ）を分割（「仮想10フレームまで」と「仮想11フレーム以降」）４__initialize
    argv = TestValue.argv4
    shot = Shot.new(argv)
    test_frame = Frame.new(shot)
    frames = TestValue.frames_i4[0..19]
    assert_equal frames, test_frame.frames_i_upto10
  end

  def test_③各フレームのボーナス種類を判定できる配列を返す１__subtotal_each_frame
    argv = TestValue.argv1
    shot = Shot.new(argv)
    test_frame = Frame.new(shot)
    subtotals = TestValue.subtotals_x1
    assert_equal subtotals, test_frame.subtotal_each_frame
  end

  def test_③各フレームのボーナス種類を判定できる配列を返す２__subtotal_each_frame
    argv = TestValue.argv2
    shot = Shot.new(argv)
    test_frame = Frame.new(shot)
    subtotals = TestValue.subtotals_x2
    assert_equal subtotals, test_frame.subtotal_each_frame
  end

  def test_③各フレームのボーナス種類を判定できる配列を返す３__subtotal_each_frame
    argv = TestValue.argv3
    shot = Shot.new(argv)
    test_frame = Frame.new(shot)
    subtotals = TestValue.subtotals_x3
    assert_equal subtotals, test_frame.subtotal_each_frame
  end

  def test_③各フレームのボーナス種類を判定できる配列を返す４__subtotal_each_frame
    argv = TestValue.argv4
    shot = Shot.new(argv)
    test_frame = Frame.new(shot)
    subtotals = TestValue.subtotals_x4
    assert_equal subtotals, test_frame.subtotal_each_frame
  end
end
