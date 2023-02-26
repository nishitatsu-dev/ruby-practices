# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'test_value'
require_relative '../shot'

# 目次
# ①投球結果（ARGV）を「数値」配列化し、クラス外から読める１〜４__results_i
# ②投球結果（ARGV）を「Xだけ文字列、他は数値」配列化し、クラス外から読める１〜４__results_x

class ShotTest < Minitest::Test
  def test_①投球結果（ARGV）を「数値」配列化し、クラス外から読める１__results_i
    argv = TestValue.argv1
    results_i = TestValue.results_i1
    test_shot = Shot.new(argv)
    assert_equal results_i, test_shot.results_i
  end

  def test_①投球結果（ARGV）を「数値」配列化し、クラス外から読める２__results_i
    argv = TestValue.argv2
    results_i = TestValue.results_i2
    test_shot = Shot.new(argv)
    assert_equal results_i, test_shot.results_i
  end

  def test_①投球結果（ARGV）を「数値」配列化し、クラス外から読める３__results_i
    argv = TestValue.argv3
    results_i = TestValue.results_i3
    test_shot = Shot.new(argv)
    assert_equal results_i, test_shot.results_i
  end

  def test_①投球結果（ARGV）を「数値」配列化し、クラス外から読める４__results_i
    argv = TestValue.argv4
    results_i = TestValue.results_i4
    test_shot = Shot.new(argv)
    assert_equal results_i, test_shot.results_i
  end

  def test_②投球結果（ARGV）を「Xだけ文字列、他は数値」配列化し、クラス外から読める１__results_x
    argv = TestValue.argv1
    results_x = TestValue.results_x1
    test_shot = Shot.new(argv)
    assert_equal results_x, test_shot.results_x
  end

  def test_②投球結果（ARGV）を「Xだけ文字列、他は数値」配列化し、クラス外から読める２__results_x
    argv = TestValue.argv2
    results_x = TestValue.results_x2
    test_shot = Shot.new(argv)
    assert_equal results_x, test_shot.results_x
  end

  def test_②投球結果（ARGV）を「Xだけ文字列、他は数値」配列化し、クラス外から読める３__results_x
    argv = TestValue.argv3
    results_x = TestValue.results_x3
    test_shot = Shot.new(argv)
    assert_equal results_x, test_shot.results_x
  end

  def test_②投球結果（ARGV）を「Xだけ文字列、他は数値」配列化し、クラス外から読める４__results_x
    argv = TestValue.argv4
    results_x = TestValue.results_x4
    test_shot = Shot.new(argv)
    assert_equal results_x, test_shot.results_x
  end
end
