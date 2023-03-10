# frozen_string_literal: true

require_relative 'bowling_oo'

class ScoreByOldRule
  attr_reader :total_score

  def initialize(game)
    @game = game
    @total_score = base_score + spare_bonus + strike_bonus
  end

  private

  def base_score
    base_score = 0
    10.times do |n|
      base_score += @game.frame_scores[(n + 1)]
    end
    base_score
  end

  def spare_bonus
    spare_bonus = 0
    9.times do |n|
      spare_bonus += @game.frame_1st_shots[(n + 2)] if @game.frame_marks[(n + 1)] == :spare
    end
    spare_bonus += @game.frame_1st_shots[:frame10_extra1] if @game.frame_marks[10] == :spare
    spare_bonus
  end

  def strike_bonus
    strike_bonus = 0
    normal_shots_s = @game.results_s_offset.take(20).delete_if { |n| n == 'dummy' }
    normal_shots_s.each_with_index do |n, idx|
      strike_bonus += @game.results_i[(idx + 1)] + @game.results_i[(idx + 2)] if n == 'X'
    end
    strike_bonus
  end
end
