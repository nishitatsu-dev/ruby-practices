# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :shots

  def initialize(first_shot, second_shot)
    @shots = [Shot.new(first_shot), Shot.new(second_shot)]
  end

  def score
    @shots[0].score + @shots[1].score
  end
end
