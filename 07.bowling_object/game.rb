# frozen_string_literal: true

require_relative 'bowling_oo'
require_relative 'frame'

class Game
  # attr_reader :frames

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
    results_strike_offset = insert_nil_after_strike(results)
    insert_nil_after_extra_shot(results_strike_offset)
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

  def insert_nil_after_extra_shot(results_strike_offset)
    normal_shots = results_strike_offset.take(20)
    extra_shots = results_strike_offset.drop(20).delete_if(&:nil?)
    extra_shots_offset = []
    extra_shots.each { |n| extra_shots_offset.push(n, nil) }
    normal_shots + extra_shots_offset
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
    strike_indexes = strike_indexes_in_normal_shots_without_nil

    knock_down_pins = []
    @frames.map(&:shots).flatten.each do |n|
      knock_down_pins << n.score unless n.mark.nil?
    end

    strike_bonus = 0
    strike_indexes.each do |n|
      strike_bonus += knock_down_pins[(n + 1)] + knock_down_pins[(n + 2)]
    end
    strike_bonus
  end

  def strike_indexes_in_normal_shots_without_nil
    strike_indexes = []
    normal_shots = @frames.take(10).map(&:shots).flatten.map(&:mark)
    normal_shots.delete_if(&:nil?).each_with_index do |n, idx|
      strike_indexes << idx if n == 'X'
    end
    strike_indexes
  end
end
