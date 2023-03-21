# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'test_value'
require_relative '../game'

# 目次
# ①投球結果（ARGV）を、「frameの配列（２ショット毎の２次元配列）」にする１〜４__frames

class GameTest < Minitest::Test
  def test_①投球結果（ARGV）を、「frameの配列（２ショット毎の２次元配列）」にする１__frames
    argv = TestValue.argv1
    game = Game.new(argv)
    assert_equal TestValue.frames_s1, game.frames
  end

  def test_①投球結果（ARGV）を、「frameの配列（２ショット毎の２次元配列）」にする２__frames
    argv = TestValue.argv2
    game = Game.new(argv)
    assert_equal TestValue.frames_s2, game.frames
  end

  def test_①投球結果（ARGV）を、「frameの配列（２ショット毎の２次元配列）」にする３__frames
    argv = TestValue.argv3
    game = Game.new(argv)
    assert_equal TestValue.frames_s3, game.frames
  end

  def test_①投球結果（ARGV）を、「frameの配列（２ショット毎の２次元配列）」にする４__frames
    argv = TestValue.argv4
    game = Game.new(argv)
    assert_equal TestValue.frames_s4, game.frames
  end
end
