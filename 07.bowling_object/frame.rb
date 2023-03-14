# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :frames, :base_score

  def initialize(results_offset)
    @results_offset = results_offset
    put_into_frame
    calc_base_score
  end

  private

  def put_into_frame
    @frames = {}
    frame_names = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :frame10_extra1, :frame10_extra2]
    frame_length = @results_offset.length / 2
    frame_length.times do |n|
      first_shot = Shot.new(@results_offset[(2 * n)])
      second_shot = Shot.new(@results_offset[(2 * n + 1)])
      @frames[frame_names[n]] = [first_shot, second_shot]
    end
  end

  def calc_base_score
    @base_score = 0
    10.times do |n|
      f = n + 1
      @base_score += @frames[f][0].score + @frames[f][1].score
    end
  end
end
