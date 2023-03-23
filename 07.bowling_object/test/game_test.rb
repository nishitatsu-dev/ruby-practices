# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'test_value'
require_relative '../game'

# 目次
# ①投球結果（ARGV）を、『１つのゲームが持つ「frameの配列」』にする１〜４__frames
# NOTE - 「frameの配列」の確認を「frame.scoreの配列」で代用
# ②ベーススコアの計算１〜４__base_score
# ③スペアボーナスの計算１〜４__spare_bonus
# ④ストライクボーナスの計算１〜４__strike_bonus
# NOTE - ②〜④はprivateを外す必要あり
# ⑤トータルスコアの計算１〜４__score

class GameTest < Minitest::Test
  def test_①投球結果（ARGV）を、『１つのゲームが持つ「frameの配列」』にする１__frames
    argv = TestValue.argv1
    game = Game.new(argv)
    assert_equal TestValue.frame_scores1, game.frames.map(&:score)
  end

  def test_①投球結果（ARGV）を、『１つのゲームが持つ「frameの配列」』にする２__frames
    argv = TestValue.argv2
    game = Game.new(argv)
    assert_equal TestValue.frame_scores2, game.frames.map(&:score)
  end

  def test_①投球結果（ARGV）を、『１つのゲームが持つ「frameの配列」』にする３__frames
    argv = TestValue.argv3
    game = Game.new(argv)
    assert_equal TestValue.frame_scores3, game.frames.map(&:score)
  end

  def test_①投球結果（ARGV）を、『１つのゲームが持つ「frameの配列」』にする４__frames
    argv = TestValue.argv4
    game = Game.new(argv)
    assert_equal TestValue.frame_scores4, game.frames.map(&:score)
  end

  # def test_②ベーススコアの計算１__base_score
  #   game = Game.new(TestValue.argv1)
  #   assert_equal TestValue.base_score1, game.base_score
  # end

  # def test_②ベーススコアの計算２__base_score
  #   game = Game.new(TestValue.argv2)
  #   assert_equal TestValue.base_score2, game.base_score
  # end

  # def test_②ベーススコアの計算３__base_score
  #   game = Game.new(TestValue.argv3)
  #   assert_equal TestValue.base_score3, game.base_score
  # end

  # def test_②ベーススコアの計算４__base_score
  #   game = Game.new(TestValue.argv4)
  #   assert_equal TestValue.base_score4, game.base_score
  # end

  # def test_③スペアボーナスの計算１__spare_bonus
  #   game = Game.new(TestValue.argv1)
  #   assert_equal TestValue.spare_bonus1, game.spare_bonus
  # end

  # def test_③スペアボーナスの計算２__spare_bonus
  #   game = Game.new(TestValue.argv2)
  #   assert_equal TestValue.spare_bonus2, game.spare_bonus
  # end

  # def test_③スペアボーナスの計算３__spare_bonus
  #   game = Game.new(TestValue.argv3)
  #   assert_equal TestValue.spare_bonus3, game.spare_bonus
  # end

  # def test_③スペアボーナスの計算４__spare_bonus
  #   game = Game.new(TestValue.argv4)
  #   assert_equal TestValue.spare_bonus4, game.spare_bonus
  # end

  # def test_④ストライクボーナスの計算１__strike_bonus
  #   game = Game.new(TestValue.argv1)
  #   assert_equal TestValue.strike_bonus1, game.strike_bonus
  # end

  # def test_④ストライクボーナスの計算２__strike_bonus
  #   game = Game.new(TestValue.argv2)
  #   assert_equal TestValue.strike_bonus2, game.strike_bonus
  # end

  # def test_④ストライクボーナスの計算３__strike_bonus
  #   game = Game.new(TestValue.argv3)
  #   assert_equal TestValue.strike_bonus3, game.strike_bonus
  # end

  # def test_④ストライクボーナスの計算４__strike_bonus
  #   game = Game.new(TestValue.argv4)
  #   assert_equal TestValue.strike_bonus4, game.strike_bonus
  # end

  def test_⑤トータルスコアの計算１__score
    game = Game.new(TestValue.argv1)
    assert_equal TestValue.total_score1, game.score
  end

  def test_⑤トータルスコアの計算２__score
    game = Game.new(TestValue.argv2)
    assert_equal TestValue.total_score2, game.score
  end

  def test_⑤トータルスコアの計算３__score
    game = Game.new(TestValue.argv3)
    assert_equal TestValue.total_score3, game.score
  end

  def test_⑤トータルスコアの計算４__score
    game = Game.new(TestValue.argv4)
    assert_equal TestValue.total_score4, game.score
  end
end
