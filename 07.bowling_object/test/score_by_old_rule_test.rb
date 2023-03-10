# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'test_value'
require_relative '../score_by_old_rule'

# 目次
# ①ベーススコア１〜４__base_score
# ②スペアボーナス１〜４__spare_bonus
# ③ストライクボーナス１〜４__strike_bonus
# ④トータルスコアを計算する１〜４__total_score
# 注：テスト①②③は、実行時にメソッドをpublicにする必要がある

class ScoreByOldRuleTest < Minitest::Test
  def test_①ベーススコア１__base_score
    argv = TestValue.argv1
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.base_score1, calc.base_score
  end

  def test_①ベーススコア２__base_score
    argv = TestValue.argv2
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.base_score2, calc.base_score
  end

  def test_①ベーススコア３__base_score
    argv = TestValue.argv3
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.base_score3, calc.base_score
  end

  def test_①ベーススコア４__base_score
    argv = TestValue.argv4
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.base_score4, calc.base_score
  end

  def test_②スペアボーナス１__spare_bonus
    argv = TestValue.argv1
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.spare_bonus1, calc.spare_bonus
  end

  def test_②スペアボーナス２__spare_bonus
    argv = TestValue.argv2
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.spare_bonus2, calc.spare_bonus
  end

  def test_②スペアボーナス３__spare_bonus
    argv = TestValue.argv3
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.spare_bonus3, calc.spare_bonus
  end

  def test_②スペアボーナス４__spare_bonus
    argv = TestValue.argv4
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.spare_bonus4, calc.spare_bonus
  end

  def test_③ストライクボーナス１__strike_bonus
    argv = TestValue.argv1
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.strike_bonus1, calc.strike_bonus
  end

  def test_③ストライクボーナス２__strike_bonus
    argv = TestValue.argv2
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.strike_bonus2, calc.strike_bonus
  end

  def test_③ストライクボーナス３__strike_bonus
    argv = TestValue.argv3
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.strike_bonus3, calc.strike_bonus
  end

  def test_③ストライクボーナス４__strike_bonus
    argv = TestValue.argv4
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.strike_bonus4, calc.strike_bonus
  end

  def test_④トータルスコアを計算する１__calc
    argv = TestValue.argv1
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.total_score1, calc.total_score
  end

  def test_④トータルスコアを計算する２__calc
    argv = TestValue.argv2
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.total_score2, calc.total_score
  end

  def test_④トータルスコアを計算する３__calc
    argv = TestValue.argv3
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.total_score3, calc.total_score
  end

  def test_④トータルスコアを計算する４__calc
    argv = TestValue.argv4
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    assert_equal TestValue.total_score4, calc.total_score
  end
end
