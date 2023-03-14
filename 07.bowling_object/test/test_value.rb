# frozen_string_literal: true

class TestValue
  # ケース１：ストライク無し、スペア無し、10フレームでボーナス投球無し
  @argv1 = ['0,9,1,5,0,0,0,0,5,0,6,0,7,0,5,1,8,1,0,4']
  @results_offset1 = %w[0 9 1 5 0 0 0 0 5 0 6 0 7 0 5 1 8 1 0 4]
  @frames_shots_s1 = { 1 => %w[0 9], 2 => %w[1 5], 3 => %w[0 0], 4 => %w[0 0], 5 => %w[5 0], 6 => %w[6 0], 7 => %w[7 0], 8 => %w[5 1], 9 => %w[8 1],
                       10 => %w[0 4] }
  @base_score1 = 52
  @spare_bonus1 = 0
  @strike_bonus1 = 0
  @total_score1 = 52

  # ケース２：ストライク有り、スペア有り、10フレームでボーナス投球２回有り
  @argv2 = ['6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,0,0']
  @results_offset2 = ['6', '3', '9', '0', '0', '3', '8', '2', '7', '3', 'X', nil, '9', '1', '8', '0', 'X', nil, 'X', nil, '0', nil, '0', nil]
  @frames_shots_s2 = { 1 => %w[6 3], 2 => %w[9 0], 3 => %w[0 3], 4 => %w[8 2], 5 => %w[7 3], 6 => ['X', nil], 7 => %w[9 1], 8 => %w[8 0], 9 => ['X', nil],
                       10 => ['X', nil], :frame10_extra1 => ['0', nil], :frame10_extra2 => ['0', nil] }
  @base_score2 = 89
  @spare_bonus2 = 25
  @strike_bonus2 = 20
  @total_score2 = 134

  # ケース３：ストライク無し、スペア有り、10フレームでボーナス投球１回有り
  @argv3 = ['6,3,9,0,0,3,8,2,7,3,0,10,9,1,8,0,0,10,9,1,8']
  @results_offset3 = ['6', '3', '9', '0', '0', '3', '8', '2', '7', '3', '0', '10', '9', '1', '8', '0', '0', '10', '9', '1', '8', nil]
  @frames_shots_s3 = { 1 => %w[6 3], 2 => %w[9 0], 3 => %w[0 3], 4 => %w[8 2], 5 => %w[7 3], 6 => %w[0 10], 7 => %w[9 1], 8 => %w[8 0], 9 => %w[0 10],
                       10 => %w[9 1], :frame10_extra1 => ['8', nil] }
  @base_score3 = 89
  @spare_bonus3 = 41
  @strike_bonus3 = 0
  @total_score3 = 130

  # ケース４：ストライク有り、スペア無し、10フレームでボーナス投球有り
  @argv4 = ['X,X,X,X,X,X,X,X,X,X,X,X']
  @results_offset4 = ['X', nil, 'X', nil, 'X', nil, 'X', nil, 'X', nil, 'X', nil, 'X', nil, 'X', nil, 'X', nil, 'X', nil, 'X', nil, 'X', nil]
  @frames_shots_s4 = { 1 => ['X', nil], 2 => ['X', nil], 3 => ['X', nil], 4 => ['X', nil], 5 => ['X', nil], 6 => ['X', nil], 7 => ['X', nil], 8 => ['X', nil],
                       9 => ['X', nil], 10 => ['X', nil], :frame10_extra1 => ['X', nil], :frame10_extra2 => ['X', nil] }
  @base_score4 = 100
  @spare_bonus4 = 0
  @strike_bonus4 = 200
  @total_score4 = 300

  class << self
    attr_reader :argv1, :argv2, :argv3, :argv4,
                :results_offset1, :results_offset2, :results_offset3, :results_offset4,
                :frames_shots_s1, :frames_shots_s2, :frames_shots_s3, :frames_shots_s4,
                :base_score1, :base_score2, :base_score3, :base_score4,
                :spare_bonus1, :spare_bonus2, :spare_bonus3, :spare_bonus4,
                :strike_bonus1, :strike_bonus2, :strike_bonus3, :strike_bonus4,
                :total_score1, :total_score2, :total_score3, :total_score4
  end
end
