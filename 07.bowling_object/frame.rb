# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :shots

  def initialize(first_shot, second_shot, next_frame)
    @shots = [Shot.new(first_shot), Shot.new(second_shot)]
    @next_frame = next_frame
  end

  def score
    @shots.map(&:score).sum
  end

  def spare_bonus
    if score == 10 && @shots[0].score != 10
      @next_frame.shots[0].score
    else
      0
    end
  end

  def strike_bonus
    @shots[0].score == 10 ? @next_frame.assist_calc_strike : 0
  end

  def assist_calc_strike
    @shots[0].score == 10 ? shots[0].score + @next_frame.shots[0].score : score
  end
end
