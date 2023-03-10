# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :first_shot_score, :score, :mark

  def initialize(first_shot, second_shot = nil)
    first_shot = Shot.new(first_shot)
    second_shot = Shot.new(second_shot)
    @first_shot_score = first_shot.score
    second_shot_score = second_shot.score
    @score = @first_shot_score + second_shot_score
    @mark = case first_shot.mark
            when 'X'
              :X
            else
              total = @first_shot_score + second_shot_score
              @mark = total == 10 ? :spare : :none
            end
  end
end
