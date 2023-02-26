# frozen_string_literal: true

require_relative 'shot'
require_relative 'frame'

class OldRule
  def initialize(shot)
    @frame = Frame.new(shot)
    @shot = shot
  end

  def total_score
    base_score + spare_bonus + strike_bonus
  end

  private

  def base_score
    @frame.frames_i_upto10.sum
  end

  def spare_bonus
    subtotals = @frame.subtotal_each_frame
    bonus_index = 0
    spare_bonus = 0
    subtotals.each_with_index do |n, idx|
      if n == 10
        bonus_index = (idx + 1) * 2
        spare_bonus += @frame.frames_i[bonus_index]
      end
    end
    spare_bonus
  end

  def strike_bonus
    shots_x_upto10 = @frame.frames_x_upto10.delete_if { |n| n == '-' }
    results_i = @shot.results_i
    strike_bonus = 0
    shots_x_upto10.each_with_index do |n, idx|
      strike_bonus += results_i[(idx + 1)] + results_i[(idx + 2)] if n == 'X'
    end
    strike_bonus
  end
end
