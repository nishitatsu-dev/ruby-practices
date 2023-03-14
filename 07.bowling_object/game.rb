# frozen_string_literal: true

require_relative 'bowling_oo'
require_relative 'frame'

class Game
  attr_reader :total_score

  def initialize(argv)
    @results = argv[0].split(',')
    fit_results_to_frame
    @frame = Frame.new(@results_offset)
    @total_score = @frame.base_score + spare_bonus + strike_bonus
  end

  private

  def fit_results_to_frame
    @results_strike_offset = if @results.include?('X')
                               @results.map { |n| n == 'X' ? ['X', nil] : n }.flatten!
                             else
                               @results
                             end
    @results_offset = if @results_strike_offset.length == 20
                        @results_strike_offset
                      else
                        cover_extra_shot
                      end
  end

  def cover_extra_shot
    normal_shots = @results_strike_offset.take(20)
    extra_shots = @results_strike_offset.drop(20).delete_if(&:nil?)
    extra_shots_offset = []
    extra_shots.each_with_index do |n, idx|
      i = idx * 2
      extra_shots_offset[i, (i + 1)] = [n, nil]
    end
    normal_shots + extra_shots_offset
  end

  def spare_bonus
    spare_frame_indexes = []
    @frame.frames.each do |key, value|
      frame_counts = value[0].score + value[1].score
      spare_frame_indexes << key if frame_counts == 10 && value[0].mark != 'X'
    end

    spare_bonus = 0
    spare_frame_indexes.each do |n|
      spare_bonus += if n == 10
                       @frame.frames[:frame10_extra1][0].score
                     else
                       @frame.frames[(n + 1)][0].score
                     end
    end
    spare_bonus
  end

  def strike_bonus
    strike_bonus = 0
    knock_down_pins = @results.map { |n| n == 'X' ? 10 : n.to_i }
    normal_shots = @results_offset.take(20).delete_if(&:nil?)
    normal_shots.each_with_index do |n, idx|
      strike_bonus += knock_down_pins[(idx + 1)] + knock_down_pins[(idx + 2)] if n == 'X'
    end
    strike_bonus
  end
end
