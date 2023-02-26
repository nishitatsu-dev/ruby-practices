# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :frames_i, :frames_i_upto10, :frames_x_upto10

  def initialize(shot)
    if shot.results_x.include?('X')
      @frames_i = shot.results_x.map { |n| n == 'X' ? [10, 0] : n }.flatten!
      @frames_i_upto10 = frames_i[0..19]
      frames_x = shot.results_x.map { |n| n == 'X' ? ['X', '-'] : n }.flatten!
      @frames_x_upto10 = frames_x[0..19]
    else
      @frames_i = shot.results_i
      @frames_i_upto10 = shot.results_i[0..19]
      @frames_x_upto10 = @frames_i_upto10
    end
  end

  def subtotal_each_frame
    frames = []
    10.times do |n|
      first_shot = 2 * n
      second_shot = 2 * n + 1
      frames[n] = @frames_x_upto10[first_shot] + @frames_x_upto10[second_shot]
    end
    frames
  end
end
