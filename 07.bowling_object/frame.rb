# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :shots

  def initialize(first_shot, second_shot)
    @shots = [Shot.new(first_shot), Shot.new(second_shot)]
  end

  def score
    @shots.map(&:score).sum
  end
end
