# frozen_string_literal: true

class Shot
  attr_reader :mark, :score

  def initialize(shot)
    @mark = shot
    @score = case shot
             when 'X'
               10
             when 'dummy'
               0
             else
               shot.to_i
             end
  end
end
