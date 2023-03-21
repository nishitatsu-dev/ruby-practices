# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'test_value'
require_relative '../frame'
require_relative '../game'

# 目次
# ①「frameの配列」を受け取り、Shotクラスを使った「フレームの配列」を算出１〜４__shots
# NOTE - 「フレームの配列」の確認を「shot.scoreの配列」で代用
# NOTE - ①は`attr_reader :shots`が必要
# ②ベーススコアの計算１〜４__base_score
# ③スペアボーナスの計算１〜４__spare_bonus
# ④ストライクボーナスの計算１〜４__strike_bonus
# NOTE - ②〜④はprivateを外す必要あり
# ⑤トータルスコアの計算１〜４__score

class FrameTest < Minitest::Test
  # def test_①「frameの配列」を受け取り、shotクラスを使った「フレームの配列」を算出１__shots
  #   frame = Frame.new(TestValue.frames_s1)
  #   results = []
  #   frame.shots.each { |n| results << n.map(&:score) }
  #   assert_equal TestValue.shots_s1, results
  # end

  # def test_①「frameの配列」を受け取り、shotクラスを使った「フレームの配列」を算出２__shots
  #   frame = Frame.new(TestValue.frames_s2)
  #   results = []
  #   frame.shots.each { |n| results << n.map(&:score) }
  #   assert_equal TestValue.shots_s2, results
  # end

  # def test_①「frameの配列」を受け取り、shotクラスを使った「フレームの配列」を算出３__shots
  #   frame = Frame.new(TestValue.frames_s3)
  #   results = []
  #   frame.shots.each { |n| results << n.map(&:score) }
  #   assert_equal TestValue.shots_s3, results
  # end

  # def test_①「frameの配列」を受け取り、shotクラスを使った「フレームの配列」を算出４__shots
  #   frame = Frame.new(TestValue.frames_s4)
  #   results = []
  #   frame.shots.each { |n| results << n.map(&:score) }
  #   assert_equal TestValue.shots_s4, results
  # end

  # def test_②ベーススコアの計算１__base_score
  #   game = Game.new(TestValue.argv1)
  #   frame = Frame.new(game.frames)
  #   assert_equal TestValue.base_score1, frame.base_score
  # end

  # def test_②ベーススコアの計算２__base_score
  #   game = Game.new(TestValue.argv2)
  #   frame = Frame.new(game.frames)
  #   assert_equal TestValue.base_score2, frame.base_score
  # end

  # def test_②ベーススコアの計算３__base_score
  #   game = Game.new(TestValue.argv3)
  #   frame = Frame.new(game.frames)
  #   assert_equal TestValue.base_score3, frame.base_score
  # end

  # def test_②ベーススコアの計算４__base_score
  #   game = Game.new(TestValue.argv4)
  #   frame = Frame.new(game.frames)
  #   assert_equal TestValue.base_score4, frame.base_score
  # end

  # def test_③スペアボーナスの計算１__spare_bonus
  #   game = Game.new(TestValue.argv1)
  #   frame = Frame.new(game.frames)
  #   assert_equal TestValue.spare_bonus1, frame.spare_bonus
  # end

  # def test_③スペアボーナスの計算２__spare_bonus
  #   game = Game.new(TestValue.argv2)
  #   frame = Frame.new(game.frames)
  #   assert_equal TestValue.spare_bonus2, frame.spare_bonus
  # end

  # def test_③スペアボーナスの計算３__spare_bonus
  #   game = Game.new(TestValue.argv3)
  #   frame = Frame.new(game.frames)
  #   assert_equal TestValue.spare_bonus3, frame.spare_bonus
  # end

  # def test_③スペアボーナスの計算４__spare_bonus
  #   game = Game.new(TestValue.argv4)
  #   frame = Frame.new(game.frames)
  #   assert_equal TestValue.spare_bonus4, frame.spare_bonus
  # end

  # def test_④ストライクボーナスの計算１__strike_bonus
  #   game = Game.new(TestValue.argv1)
  #   frame = Frame.new(game.frames)
  #   assert_equal TestValue.strike_bonus1, frame.strike_bonus
  # end

  # def test_④ストライクボーナスの計算２__strike_bonus
  #   game = Game.new(TestValue.argv2)
  #   frame = Frame.new(game.frames)
  #   assert_equal TestValue.strike_bonus2, frame.strike_bonus
  # end

  # def test_④ストライクボーナスの計算３__strike_bonus
  #   game = Game.new(TestValue.argv3)
  #   frame = Frame.new(game.frames)
  #   assert_equal TestValue.strike_bonus3, frame.strike_bonus
  # end

  # def test_④ストライクボーナスの計算４__strike_bonus
  #   game = Game.new(TestValue.argv4)
  #   frame = Frame.new(game.frames)
  #   assert_equal TestValue.strike_bonus4, frame.strike_bonus
  # end

  def test_⑤トータルスコアの計算１__score
    game = Game.new(TestValue.argv1)
    frame = Frame.new(game.frames)
    assert_equal TestValue.total_score1, frame.score
  end

  def test_⑤トータルスコアの計算２__score
    game = Game.new(TestValue.argv2)
    frame = Frame.new(game.frames)
    assert_equal TestValue.total_score2, frame.score
  end

  def test_⑤トータルスコアの計算３__score
    game = Game.new(TestValue.argv3)
    frame = Frame.new(game.frames)
    assert_equal TestValue.total_score3, frame.score
  end

  def test_⑤トータルスコアの計算４__score
    game = Game.new(TestValue.argv4)
    frame = Frame.new(game.frames)
    assert_equal TestValue.total_score4, frame.score
  end
end
