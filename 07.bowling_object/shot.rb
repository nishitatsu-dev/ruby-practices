# frozen_string_literal: true

class Shot
  attr_reader :score

  def initialize(shot)
    @score = case shot
             when 'X'
               10
             when nil
               0
             else
               shot.to_i
             end
  end
end
