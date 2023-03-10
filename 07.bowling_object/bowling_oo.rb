# frozen_string_literal: true

require_relative 'shot'
require_relative 'frame'
require_relative 'score_by_old_rule'

class Game
  attr_reader :results_i, :results_s_offset,
              :frame_1st_shots, :frame_scores, :frame_marks

  def self.score(argv)
    game = Game.new(argv)
    calc = ScoreByOldRule.new(game)
    p calc.total_score
  end

  def initialize(argv)
    @results_s = argv[0].split(',')
    @results_i = @results_s.map { |n| n == 'X' ? 10 : n.to_i }
    fit_results_to_frame
    calc_frame_data
  end

  private

  def fit_results_to_frame
    @results_s_offset = if @results_s.include?('X')
                          @results_s.map { |n| n == 'X' ? %w[X dummy] : n }.flatten!
                        else
                          @results_s
                        end
    fit_extra_shots
  end

  def fit_extra_shots
    return if @results_s_offset.length == 20

    normal_shots = @results_s_offset.take(20)
    extra_shots = @results_s_offset.drop(20).delete_if { |n| n == 'dummy' }
    extra_shots_offset = []
    extra_shots.each_with_index do |n, idx|
      i = idx * 2
      extra_shots_offset[i, (i + 1)] = [n, 'dummy']
    end
    @results_s_offset = normal_shots + extra_shots_offset
  end

  def calc_frame_data
    @frame_1st_shots = {}
    @frame_scores = {}
    @frame_marks = {}
    frame_names = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :frame10_extra1, :frame10_extra2]
    frame_length = @results_s_offset.length / 2
    frame_length.times do |n|
      first_shot = @results_s_offset[(2 * n)]
      second_shot = @results_s_offset[(2 * n + 1)]
      frame = Frame.new(first_shot, second_shot)
      @frame_1st_shots[frame_names[n]] = frame.first_shot_score
      @frame_scores[frame_names[n]] = frame.score
      @frame_marks[frame_names[n]] = frame.mark
    end
  end
end

__FILE__ == $PROGRAM_NAME && Game.score(ARGV)
