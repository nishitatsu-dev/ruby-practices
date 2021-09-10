#!/usr/bin/env ruby

class Score
  def self.count_score(result)
    self.new.count_score(result)
  end

  def count_score(result)
    pins_result = result.split(",")
    if pins_result.include?("x")
      pins_string = pins_result.map { |n| n == "x" ? ["10", "dummy0"] : n }.flatten!
    else
      pins_string = pins_result
    end
    pins_1to9frame = pins_string[0..17]
    pins_10frame = pins_string[18..24] - ["dummy0"]
    pins_integer = (pins_1to9frame + pins_10frame).map(&:to_i)

    # ①倒したピンの合計。
    base_score = pins_integer.sum

    # ②「スペア又はストライク」のボーナス値。次の投球を加算（＝次のフレームの１投目を加算）。
    frame_scores = []
    9.times do |n|
      from = 2 * n
      to = 2 * n + 1
      frame_scores << pins_1to9frame[from..to].map(&:to_i).sum
    end
    frames_of_spare_or_strike = frame_scores.each_index.select { |n| frame_scores[n] == 10 }
    indexes_of_1after = frames_of_spare_or_strike.map { |n| n * 2 + 2 }
    bonus_by_spare_or_strike = pins_integer.values_at(*indexes_of_1after).sum

    # ③「ストライク」のボーナス値。次の次の投球を加算。
    indexes_of_strike = pins_1to9frame.each_index.select { |n| pins_1to9frame[n] == "dummy0" }
    indexes_of_2after = indexes_of_strike.map { |n| n + 2 }
    # ストライクが連続した場合への対応。dummy0の２個後もdummy0になるので、さらに１個後にずらす。
    indexes_of_overlap = indexes_of_2after & indexes_of_strike
    if indexes_of_overlap == [] 
      bonus_by_strike = pins_integer.values_at(*indexes_of_2after).sum
    else
      modified_indexes = indexes_of_2after - indexes_of_strike + indexes_of_overlap.map { |n| n + 1 }
      bonus_by_strike = pins_integer.values_at(*modified_indexes).sum
    end

    # 上記①②③の合計
    p total = base_score + bonus_by_spare_or_strike + bonus_by_strike
  end
end

if __FILE__ == $0
  Score.count_score(*ARGV)
end
