# frozen_string_literal: true

require_relative 'bowling_oo'
require_relative 'frame'

class Game
  def initialize(argv)
    results = argv[0].split(',')
    results_offset = fit_results_to_frames(results)
    @frames = []
    (results_offset.length / 2).times do |_|
      second_shot = results_offset.pop
      first_shot = results_offset.pop
      next_frame = @frames[0]
      @frames.unshift(Frame.new(first_shot, second_shot, next_frame))
    end
  end

  def score
    base_score = @frames.take(10).map(&:score).sum
    spare_bonus = @frames.take(10).map(&:spare_bonus).sum
    strike_bonus = @frames.take(10).map(&:strike_bonus).sum
    base_score + spare_bonus + strike_bonus
  end

  private

  def fit_results_to_frames(results)
    results_offset = insert_nil_after_strike(results)
    results_offset.push(nil) if results_offset.length.odd?
    results_offset
  end

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
