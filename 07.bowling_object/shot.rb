# frozen_string_literal: true

class Shot
  attr_reader :score

  def initialize(shot)
    @score = shot == 'X' ? 10 : shot.to_i
  end
end
