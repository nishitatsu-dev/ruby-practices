# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'test_value'
require_relative '../bowling_oo'

# 目次
# ①投球結果（ARGV）を投球別の数値配列に変換して出力１〜４__results_i
# ②フレームに合うように「X」と「10フレーム追加投球」の後にdummyを追加して出力１〜３__results_s_offset
# ③各フレームのfirst_shot数値をハッシュで返す１〜４__frame_scores
# ④各フレームの値をハッシュで返す１〜４__frame_scores
# ⑤各フレームのボーナスを判定できるハッシュを返す１〜４__frame_marks

class GameTest < Minitest::Test
  def test_①投球結果（ARGV）を投球別の数値配列に変換して出力１__results_s
    argv = TestValue.argv1
    game = Game.new(argv)
    assert_equal TestValue.results_i1, game.results_i
  end

  def test_①投球結果（ARGV）を投球別の数値配列に変換して出力２__results_s
    argv = TestValue.argv2
    game = Game.new(argv)
    assert_equal TestValue.results_i2, game.results_i
  end

  def test_①投球結果（ARGV）を投球別の数値配列に変換して出力３__results_s
    argv = TestValue.argv3
    game = Game.new(argv)
    assert_equal TestValue.results_i3, game.results_i
  end

  def test_①投球結果（ARGV）を投球別の数値配列に変換して出力４__results_s
    argv = TestValue.argv4
    game = Game.new(argv)
    assert_equal TestValue.results_i4, game.results_i
  end

  def test_②フレームに合うように「X」と「10フレーム追加投球」の後にdummyを追加して出力１__results_s_offset
    argv = TestValue.argv2
    game = Game.new(argv)
    assert_equal TestValue.results_s_offset2, game.results_s_offset
  end

  def test_②フレームに合うように「X」と「10フレーム追加投球」の後にdummyを追加して出力２__results_s_offset
    argv = TestValue.argv3
    game = Game.new(argv)
    assert_equal TestValue.results_s_offset3, game.results_s_offset
  end

  def test_②フレームに合うように「X」と「10フレーム追加投球」の後にdummyを追加して出力３__results_s_offset
    argv = TestValue.argv4
    game = Game.new(argv)
    assert_equal TestValue.results_s_offset4, game.results_s_offset
  end

  def test_③各フレームのfirst_shot数値をハッシュで返す１__frame_1st_shots
    argv = TestValue.argv1
    game = Game.new(argv)
    assert_equal TestValue.frame_1st_shots1, game.frame_1st_shots
  end

  def test_③各フレームのfirst_shot数値をハッシュで返す２__frame_1st_shots
    argv = TestValue.argv2
    game = Game.new(argv)
    assert_equal TestValue.frame_1st_shots2, game.frame_1st_shots
  end

  def test_③各フレームのfirst_shot数値をハッシュで返す３__frame_1st_shots
    argv = TestValue.argv3
    game = Game.new(argv)
    assert_equal TestValue.frame_1st_shots3, game.frame_1st_shots
  end

  def test_③各フレームのfirst_shot数値をハッシュで返す４__frame_1st_shots
    argv = TestValue.argv4
    game = Game.new(argv)
    assert_equal TestValue.frame_1st_shots4, game.frame_1st_shots
  end

  def test_④各フレームの値をハッシュで返す１__frame_scores
    argv = TestValue.argv1
    game = Game.new(argv)
    assert_equal TestValue.frame_scores1, game.frame_scores
  end

  def test_④各フレームの値をハッシュで返す２__frame_scores
    argv = TestValue.argv2
    game = Game.new(argv)
    assert_equal TestValue.frame_scores2, game.frame_scores
  end

  def test_④各フレームの値をハッシュで返す３__frame_scores
    argv = TestValue.argv3
    game = Game.new(argv)
    assert_equal TestValue.frame_scores3, game.frame_scores
  end

  def test_④各フレームの値をハッシュで返す４__frame_scores
    argv = TestValue.argv4
    game = Game.new(argv)
    assert_equal TestValue.frame_scores4, game.frame_scores
  end

  def test_⑤各フレームのボーナスを判定できるハッシュを返す１__frame_marks
    argv = TestValue.argv1
    game = Game.new(argv)
    assert_equal TestValue.frame_marks1, game.frame_marks
  end

  def test_⑤各フレームのボーナスを判定できるハッシュを返す２__frame_marks
    argv = TestValue.argv2
    game = Game.new(argv)
    assert_equal TestValue.frame_marks2, game.frame_marks
  end

  def test_⑤各フレームのボーナスを判定できるハッシュを返す３__frame_marks
    argv = TestValue.argv3
    game = Game.new(argv)
    assert_equal TestValue.frame_marks3, game.frame_marks
  end

  def test_⑤各フレームのボーナスを判定できるハッシュを返す４__frame_marks
    argv = TestValue.argv4
    game = Game.new(argv)
    assert_equal TestValue.frame_marks4, game.frame_marks
  end
end
