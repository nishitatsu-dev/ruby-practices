# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'test_value'
require_relative '../old_rule'

# 目次
# ①旧ルールでのトータルスコア１〜４__total_score
# ②旧ルールでのベーススコア１〜４__base_score
# ③旧ルールでのスペアボーナス１〜４__spare_bonus
# ④旧ルールでのストライクボーナス１〜３__strike_bonus
# 注：テスト②③④は、実行時にメソッドをpublicにする必要がある

class OldRuleTest < Minitest::Test
  def test_①旧ルールでのトータルスコア１__total_score
    argv = TestValue.argv1
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    total_score = TestValue.total_score1
    assert_equal total_score, old_rule.total_score
  end

  def test_①旧ルールでのトータルスコア２__total_score
    argv = TestValue.argv2
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    total_score = TestValue.total_score2
    assert_equal total_score, old_rule.total_score
  end

  def test_①旧ルールでのトータルスコア３__total_score
    argv = TestValue.argv3
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    total_score = TestValue.total_score3
    assert_equal total_score, old_rule.total_score
  end

  def test_①旧ルールでのトータルスコア４__total_score
    argv = TestValue.argv4
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    total_score = TestValue.total_score4
    assert_equal total_score, old_rule.total_score
  end

  def test_②旧ルールでのベーススコア１__base_score
    argv = TestValue.argv1
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    base_score = TestValue.frames_i1[0..19].sum
    assert_equal base_score, old_rule.base_score
  end

  def test_②旧ルールでのベーススコア２__base_score
    argv = TestValue.argv2
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    base_score = TestValue.frames_i2[0..19].sum
    assert_equal base_score, old_rule.base_score
  end

  def test_②旧ルールでのベーススコア３__base_score
    argv = TestValue.argv3
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    base_score = TestValue.frames_i3[0..19].sum
    assert_equal base_score, old_rule.base_score
  end

  def test_②旧ルールでのベーススコア４__base_score
    argv = TestValue.argv4
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    base_score = TestValue.frames_i4[0..19].sum
    assert_equal base_score, old_rule.base_score
  end

  def test_③旧ルールでのスペアボーナス１__spare_bonus
    argv = TestValue.argv1
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    spare_bonus = 0
    assert_equal spare_bonus, old_rule.spare_bonus
  end

  def test_③旧ルールでのスペアボーナス２__spare_bonus
    argv = TestValue.argv2
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    spare_bonus = 25
    assert_equal spare_bonus, old_rule.spare_bonus
  end

  def test_③旧ルールでのスペアボーナス３__spare_bonus
    argv = TestValue.argv3
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    spare_bonus = 41
    assert_equal spare_bonus, old_rule.spare_bonus
  end

  def test_③旧ルールでのスペアボーナス４__spare_bonus
    argv = TestValue.argv4
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    spare_bonus = 0
    assert_equal spare_bonus, old_rule.spare_bonus
  end

  def test_④旧ルールでのストライクボーナス１__strike_bonus
    argv = TestValue.argv1
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    strike_bonus = 0
    assert_equal strike_bonus, old_rule.strike_bonus
  end

  def test_④旧ルールでのストライクボーナス２__strike_bonus
    argv = TestValue.argv2
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    strike_bonus = 20
    assert_equal strike_bonus, old_rule.strike_bonus
  end

  def test_④旧ルールでのストライクボーナス３__strike_bonus
    argv = TestValue.argv4
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    strike_bonus = 200
    assert_equal strike_bonus, old_rule.strike_bonus
  end
end
