# frozen_string_literal: true

require_relative 'shot'

class Frame
  def initialize(frames)
    @shots = []
    frames.each do |n|
      @shots << [Shot.new(n[0]), Shot.new(n[1])]
    end
  end

  def score
    base_score + spare_bonus + strike_bonus
  end

  private

  def base_score
    base_score = 0
    @shots.take(10).each do |n|
      base_score += n[0].score + n[1].score
    end
    base_score
  end

  def spare_bonus
    spare_frame_indexes = []
    @shots.each_with_index do |n, idx|
      frame_counts = n[0].score + n[1].score
      spare_frame_indexes << idx if frame_counts == 10 && n[0].mark != 'X'
    end

    spare_bonus = 0
    spare_frame_indexes.each do |n|
      spare_bonus += @shots[(n + 1)][0].score
    end
    spare_bonus
  end

  def strike_bonus
    strike_indexes = []
    normal_shots = @shots.take(10).flatten.map(&:mark)
    normal_shots.delete_if(&:nil?).each_with_index do |n, idx|
      strike_indexes << idx if n == 'X'
    end

    knock_down_pins = []
    @shots.flatten.each do |n|
      knock_down_pins << n.score unless n.mark.nil?
    end

    strike_bonus = 0
    strike_indexes.each do |n|
      strike_bonus += knock_down_pins[(n + 1)] + knock_down_pins[(n + 2)]
    end
    strike_bonus
  end
end
