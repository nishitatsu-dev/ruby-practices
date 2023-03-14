# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'test_value'
require_relative '../frame'

# 目次
# ①キーにフレーム番号、値にショットの配列を持つハッシュを生成１〜４__put_into_frames
# NOTE - 「ショットの配列」の確認を「shot.markの配列」で代用
# ②10フレームまでの投球結果（倒したピン数）合計を算出１〜４__calc_base_score
class FrameTest < Minitest::Test
  def test_①キーにフレーム番号、値にショットの配列を持つハッシュを生成１__put_into_frames
    frames = Frame.new(TestValue.results_offset1).frames
    frames.each { |key, value| frames[key] = value.map(&:mark) }
    assert_equal TestValue.frames_shots_s1, frames
  end

  def test_①キーにフレーム番号、値にショットの配列を持つハッシュを生成２__put_into_frames
    frames = Frame.new(TestValue.results_offset2).frames
    frames.each { |key, value| frames[key] = value.map(&:mark) }
    assert_equal TestValue.frames_shots_s2, frames
  end

  def test_①キーにフレーム番号、値にショットの配列を持つハッシュを生成３__put_into_frames
    frames = Frame.new(TestValue.results_offset3).frames
    frames.each { |key, value| frames[key] = value.map(&:mark) }
    assert_equal TestValue.frames_shots_s3, frames
  end

  def test_①キーにフレーム番号、値にショットの配列を持つハッシュを生成４__put_into_frames
    frames = Frame.new(TestValue.results_offset4).frames
    frames.each { |key, value| frames[key] = value.map(&:mark) }
    assert_equal TestValue.frames_shots_s4, frames
  end

  def test_②10フレームまでの投球結果（倒したピン数）合計を算出１__calc_base_score
    frame = Frame.new(TestValue.results_offset1)
    assert_equal TestValue.base_score1, frame.base_score
  end

  def test_②10フレームまでの投球結果（倒したピン数）合計を算出２__calc_base_score
    frame = Frame.new(TestValue.results_offset2)
    assert_equal TestValue.base_score2, frame.base_score
  end

  def test_②10フレームまでの投球結果（倒したピン数）合計を算出３__calc_base_score
    frame = Frame.new(TestValue.results_offset3)
    assert_equal TestValue.base_score3, frame.base_score
  end

  def test_②10フレームまでの投球結果（倒したピン数）合計を算出４__calc_base_score
    frame = Frame.new(TestValue.results_offset4)
    assert_equal TestValue.base_score4, frame.base_score
  end
end
