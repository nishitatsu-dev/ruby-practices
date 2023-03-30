# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :shots

  def initialize(normal_shots, extra_shots = nil, extra: false)
    first_shot = normal_shots.shift
    second_shot = normal_shots.shift
    @shots = [Shot.new(first_shot), Shot.new(second_shot)]
    @extra = extra

    @next_frame = if normal_shots != []
                    Frame.new(normal_shots, extra_shots)
                  elsif extra_shots != []
                    Frame.new(extra_shots, [], extra: true)
                  end
  end

  def score
    @shots.map(&:score).sum
  end

  def mark
    if @extra == true
      :extra
    elsif @shots[0].mark == 'X'
      :X
    elsif score == 10
      :spare
    else
      :none
    end
  end

  def base_score
    base_score = @next_frame.nil? ? 0 : @next_frame.base_score
    base_score += score if mark != :extra
    base_score
  end

  def spare_bonus
    spare_bonus = @next_frame.nil? ? 0 : @next_frame.spare_bonus
    spare_bonus += @next_frame.shots[0].score if mark == :spare
    spare_bonus
  end

  def strike_bonus
    strike_bonus = @next_frame.nil? ? 0 : @next_frame.strike_bonus
    strike_bonus += @next_frame.assist_calc_strike if mark == :X
    strike_bonus
  end

  def assist_calc_strike
    if mark != :X
      score
    else
      shots[0].score + @next_frame.shots[0].score
    end
  end
end
