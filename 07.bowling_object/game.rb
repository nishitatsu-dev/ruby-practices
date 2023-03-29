# frozen_string_literal: true

require_relative 'bowling_oo'
require_relative 'frame'

class Game
  def initialize(argv)
    results = argv[0].split(',')
    results_offset = fit_results_to_frames(results)
    @frames = []
    (results_offset.length / 2).times do |n|
      first_shot = results_offset[(2 * n)]
      second_shot = results_offset[(2 * n + 1)]
      @frames << Frame.new(first_shot, second_shot)
    end
  end

  def score
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

  def base_score
    @frames.take(10).map(&:score).sum
  end

  def spare_bonus
    spare_frames = []
    normal_frames = @frames.take(10)
    normal_frames.each_with_index do |n, idx|
      spare_frames << idx if n.score == 10 && n.shots[0].mark != 'X'
    end

    spare_bonus = 0
    spare_frames.each do |n|
      spare_bonus += @frames[(n + 1)].shots[0].score
    end
    spare_bonus
  end

  def strike_bonus
    strike_frames = []
    normal_frames = @frames.take(10)
    normal_frames.each_with_index do |n, idx|
      strike_frames << idx if n.shots[0].mark == 'X'
    end

    strike_bonus = 0
    strike_frames.each do |n|
      strike_bonus += if @frames[(n + 1)].shots[0].mark == 'X'
                        @frames[(n + 1)].shots[0].score + @frames[(n + 2)].shots[0].score
                      else
                        @frames[(n + 1)].score
                      end
    end
    strike_bonus
  end
end
