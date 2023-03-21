# frozen_string_literal: true

require_relative 'bowling_oo'
require_relative 'frame'

class Game
  attr_reader :frames

  def initialize(argv)
    results = argv[0].split(',')
    results_offset = fit_results_to_frame(results)
    @frames = []
    (results_offset.length / 2).times do |n|
      first_shot = results_offset[(2 * n)]
      second_shot = results_offset[(2 * n + 1)]
      @frames << [first_shot, second_shot]
    end
  end

  def score
    frame = Frame.new(@frames)
    frame.score
  end

  private

  def fit_results_to_frame(results)
    results_strike_offset = if results.include?('X')
                              results.map { |n| n == 'X' ? ['X', nil] : n }.flatten!
                            else
                              results
                            end
    if results_strike_offset.length == 20
      results_strike_offset
    else
      add_extra_shots_offset(results_strike_offset)
    end
  end

  def add_extra_shots_offset(results_strike_offset)
    normal_shots = results_strike_offset.take(20)
    extra_shots = results_strike_offset.drop(20).delete_if(&:nil?)
    extra_shots_offset = []
    extra_shots.each_with_index do |n, idx|
      i = idx * 2
      extra_shots_offset[i, (i + 1)] = [n, nil]
    end
    normal_shots + extra_shots_offset
  end
end
