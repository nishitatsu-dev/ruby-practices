# frozen_string_literal: true

require_relative 'shot'
require_relative 'old_rule'

class Game
  def self.score(argv)
    shot = Shot.new(argv)
    old_rule = OldRule.new(shot)
    p old_rule.total_score
  end
end

__FILE__ == $PROGRAM_NAME && Game.score(ARGV)
