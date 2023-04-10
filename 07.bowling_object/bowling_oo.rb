# frozen_string_literal: true

require_relative 'game'

class ScoreCalcManager
  def self.result(argv)
    game = Game.new(argv)
    p game.score
  end
end

__FILE__ == $PROGRAM_NAME && ScoreCalcManager.result(ARGV)
