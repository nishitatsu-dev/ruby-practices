# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'test_value'
require_relative '../game'

# 目次
# ①フレームに合うように「X」と「10フレーム追加投球」の後にnilを追加して出力１〜３__fit_results_to_frame
# NOTE - ①はinitializeメソッド中の`fit_results_to_frame`をコメントアウトしてから走らせる必要あり。
# ②スペアボーナスの計算１〜４__spare_bonus
# ③ストライクボーナスの計算１〜４__strike_bonus
# ④トータルスコアの計算１〜４__total_score

class GameTest < Minitest::Test
  # def test_①フレームに合うように「X」と「10フレーム追加投球」の後にnilを追加して出力１__fit_results_to_frame
  #   argv = TestValue.argv2
  #   game = Game.new(argv)
  #   assert_equal TestValue.results_offset2, game.fit_results_to_frame
  # end

  # def test_①フレームに合うように「X」と「10フレーム追加投球」の後にnilを追加して出力２__fit_results_to_frame
  #   argv = TestValue.argv3
  #   game = Game.new(argv)
  #   assert_equal TestValue.results_offset3, game.fit_results_to_frame
  # end

  # def test_①フレームに合うように「X」と「10フレーム追加投球」の後にnilを追加して出力３__fit_results_to_frame
  #   argv = TestValue.argv4
  #   game = Game.new(argv)
  #   assert_equal TestValue.results_offset4, game.fit_results_to_frame
  # end

  def test_②スペアボーナスの計算１__spare_bonus
    argv = TestValue.argv1
    game = Game.new(argv)
    assert_equal TestValue.spare_bonus1, game.spare_bonus
  end

  def test_②スペアボーナスの計算２__spare_bonus
    argv = TestValue.argv2
    game = Game.new(argv)
    assert_equal TestValue.spare_bonus2, game.spare_bonus
  end

  def test_②スペアボーナスの計算３__spare_bonus
    argv = TestValue.argv3
    game = Game.new(argv)
    assert_equal TestValue.spare_bonus3, game.spare_bonus
  end

  def test_②スペアボーナスの計算４__spare_bonus
    argv = TestValue.argv4
    game = Game.new(argv)
    assert_equal TestValue.spare_bonus4, game.spare_bonus
  end

  def test_③ストライクボーナスの計算１__strike_bonus
    argv = TestValue.argv1
    game = Game.new(argv)
    assert_equal TestValue.strike_bonus1, game.strike_bonus
  end

  def test_③ストライクボーナスの計算２__strike_bonus
    argv = TestValue.argv2
    game = Game.new(argv)
    assert_equal TestValue.strike_bonus2, game.strike_bonus
  end

  def test_③ストライクボーナスの計算３__strike_bonus
    argv = TestValue.argv3
    game = Game.new(argv)
    assert_equal TestValue.strike_bonus3, game.strike_bonus
  end

  def test_③ストライクボーナスの計算４__strike_bonus
    argv = TestValue.argv4
    game = Game.new(argv)
    assert_equal TestValue.strike_bonus4, game.strike_bonus
  end

  def test_④トータルスコアの計算１__total_score
    argv = TestValue.argv1
    game = Game.new(argv)
    assert_equal TestValue.total_score1, game.total_score
  end

  def test_④トータルスコアの計算２__total_score
    argv = TestValue.argv2
    game = Game.new(argv)
    assert_equal TestValue.total_score2, game.total_score
  end

  def test_④トータルスコアの計算３__total_score
    argv = TestValue.argv3
    game = Game.new(argv)
    assert_equal TestValue.total_score3, game.total_score
  end

  def test_④トータルスコアの計算４__total_score
    argv = TestValue.argv4
    game = Game.new(argv)
    assert_equal TestValue.total_score4, game.total_score
  end
end
