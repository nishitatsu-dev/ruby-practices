# frozen_string_literal: true

require_relative 'frame'

class Game
  def initialize(argv)
    raw_shots = argv[0].split(',')
    shots = fit_shots_to_frames(raw_shots)
    @frames = []
    shots.reverse.each_slice(2) do |n|
      second_shot, first_shot = n
      next_frame = @frames.last
      @frames.push(Frame.new(first_shot, second_shot, next_frame))
    end
  end

  def score
    normal_frames = @frames.reverse.take(10)
    base_score = normal_frames.map(&:score).sum
    spare_bonus = normal_frames.map(&:spare_bonus).sum
    strike_bonus = normal_frames.map(&:strike_bonus).sum
    base_score + spare_bonus + strike_bonus
  end

  private

  def fit_shots_to_frames(raw_shots)
    shots = insert_nil_after_strike(raw_shots)
    shots.push(nil) if shots.length.odd?
    shots
  end

  def insert_nil_after_strike(raw_shots)
    strike_indexes = []
    raw_shots.each_with_index do |n, idx|
      strike_indexes << idx if n == 'X'
    end
    strike_indexes.reverse_each do |n|
      raw_shots.insert((n + 1), nil)
    end
    raw_shots
  end
end
