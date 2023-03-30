# frozen_string_literal: true

require_relative 'bowling_oo'
require_relative 'frame'

class Game
  def initialize(argv)
    results = argv[0].split(',')
    results_offset = insert_nil_after_strike(results)
    normal_shots = results_offset.shift(20)
    extra_shots = results_offset.delete_if(&:nil?)
    @frame = Frame.new(normal_shots, extra_shots)
  end

  def score
    @frame.base_score + @frame.spare_bonus + @frame.strike_bonus
  end

  private

  def insert_nil_after_strike(results)
    strike_indexes = []
    results.each_with_index do |n, idx|
      strike_indexes << idx if n == 'X'
    end
    strike_indexes.reverse_each do |n|
      results.insert((n + 1), nil)
    end
    results
  end
end
