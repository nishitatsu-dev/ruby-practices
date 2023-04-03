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

  def mark
    if @shots[0].mark == 'X'
      :X
    elsif score == 10
      :spare
    else
      :none
    end
  end

  def spare_bonus
    mark == :spare ? @next_frame.shots[0].score : 0
  end

  def strike_bonus
    mark == :X ? @next_frame.assist_calc_strike : 0
  end

  def assist_calc_strike
    mark == :X ? shots[0].score + @next_frame.shots[0].score : score
  end
end
