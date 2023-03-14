# frozen_string_literal: true

require_relative 'game'

class IO
  def self.result(argv)
    game = Game.new(argv)
    p game.total_score
  end
end

__FILE__ == $PROGRAM_NAME && IO.result(ARGV)
