#!/usr/bin/env ruby

class Score
  def self.count_score(result)
    self.new.count_score(result)
  end

  def count_score(result)
    results_array = result.split(',')
    pins = if results_array.include?('X')
             results_array.map { |n| n == 'X' ? %w[10 dummy0] : n }.flatten!
           else
             results_array
           end
    pins_1to9frame = pins[0..17]
    pins_10frame = pins[18..24] - ['dummy0']
    pins_integer = (pins_1to9frame + pins_10frame).map(&:to_i)
    # 「倒したピン数」に下記①②ボーナスを加算。
    p pins_integer.sum + bonus_by_spare_or_strike(pins_1to9frame, pins_integer) + bonus_by_strike(pins_1to9frame, pins_integer)
  end

  # ①「スペア又はストライク」ボーナス。次の投球を加算（＝次のフレームの１投目を加算）。
  def bonus_by_spare_or_strike(pins_1to9frame, pins_integer)
    frame_scores = []
    9.times do |n|
      from = 2 * n
      to = 2 * n + 1
      frame_scores << pins_1to9frame[from..to].map(&:to_i).sum
    end
    frames_of_spare_or_strike = frame_scores.each_index.select { |n| frame_scores[n] == 10 }
    indexes_of_1after = frames_of_spare_or_strike.map { |n| n * 2 + 2 }
    pins_integer.values_at(*indexes_of_1after).sum
  end

  # ②「ストライク」ボーナス。次の次の投球を加算。
  def bonus_by_strike(pins_1to9frame, pins_integer)
    indexes_of_strike = pins_1to9frame.each_index.select { |n| pins_1to9frame[n] == 'dummy0' }
    indexes_of_2after = indexes_of_strike.map { |n| n + 2 }
    # 連続ストライクへの対応。dummy0の次の次がdummy0になるので、さらに１個後にずらす。
    indexes_of_overlap = indexes_of_2after & indexes_of_strike
    if indexes_of_overlap == []
      pins_integer.values_at(*indexes_of_2after).sum
    else
      modified_indexes = indexes_of_2after - indexes_of_strike + indexes_of_overlap.map { |n| n + 1 }
      pins_integer.values_at(*modified_indexes).sum
    end
  end
end

__FILE__ == $0 && Score.count_score(*ARGV)
