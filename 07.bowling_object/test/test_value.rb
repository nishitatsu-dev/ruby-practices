# frozen_string_literal: true

class TestValue
  # ケース１：ストライク無し、スペア無し、10フレームでボーナス投球無し
  @argv1 = ['0,9,1,5,0,0,0,0,5,0,6,0,7,0,5,1,8,1,0,4']
  @results_i1 = [0, 9, 1, 5, 0, 0, 0, 0, 5, 0, 6, 0, 7, 0, 5, 1, 8, 1, 0, 4]
  @results_s_offset1 = %w[0 9 1 5 0 0 0 0 5 0 6 0 7 0 5 1 8 1 0 4]
  @frame_1st_shots1 = { 1 => 0, 2 => 1, 3 => 0, 4 => 0, 5 => 5, 6 => 6, 7 => 7, 8 => 5, 9 => 8, 10 => 0 }
  @frame_scores1 = { 1 => 9, 2 => 6, 3 => 0, 4 => 0, 5 => 5, 6 => 6, 7 => 7, 8 => 6, 9 => 9, 10 => 4 }
  @frame_marks1 = { 1 => :none, 2 => :none, 3 => :none, 4 => :none, 5 => :none, 6 => :none, 7 => :none, 8 => :none, 9 => :none, 10 => :none }
  @base_score1 = 52
  @spare_bonus1 = 0
  @strike_bonus1 = 0
  @total_score1 = 52

  # ケース２：ストライク有り、スペア有り、10フレームでボーナス投球２回有り
  @argv2 = ['6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,0,0']
  @results_i2 = [6, 3, 9, 0, 0, 3, 8, 2, 7, 3, 10, 9, 1, 8, 0, 10, 10, 0, 0]
  @results_s_offset2 = %w[6 3 9 0 0 3 8 2 7 3 X dummy 9 1 8 0 X dummy X dummy 0 dummy 0
                          dummy]
  @frame_1st_shots2 = { 1 => 6, 2 => 9, 3 => 0, 4 => 8, 5 => 7, 6 => 10, 7 => 9, 8 => 8, 9 => 10, 10 => 10, :frame10_extra1 => 0, :frame10_extra2 => 0 }
  @frame_scores2 = { 1 => 9, 2 => 9, 3 => 3, 4 => 10, 5 => 10, 6 => 10, 7 => 10, 8 => 8, 9 => 10, 10 => 10, :frame10_extra1 => 0, :frame10_extra2 => 0 }
  @frame_marks2 = { 1 => :none, 2 => :none, 3 => :none, 4 => :spare, 5 => :spare, 6 => :X, 7 => :spare, 8 => :none, 9 => :X, 10 => :X, :frame10_extra1 => :none,
                    :frame10_extra2 => :none }
  @base_score2 = 89
  @spare_bonus2 = 25
  @strike_bonus2 = 20
  @total_score2 = 134

  # ケース３：ストライク無し、スペア有り、10フレームでボーナス投球１回有り
  @argv3 = ['6,3,9,0,0,3,8,2,7,3,0,10,9,1,8,0,0,10,9,1,8']
  @results_i3 = [6, 3, 9, 0, 0, 3, 8, 2, 7, 3, 0, 10, 9, 1, 8, 0, 0, 10, 9, 1, 8]
  @results_s_offset3 = %w[6 3 9 0 0 3 8 2 7 3 0 10 9 1 8 0 0 10 9 1 8 dummy]
  @frame_1st_shots3 = { 1 => 6, 2 => 9, 3 => 0, 4 => 8, 5 => 7, 6 => 0, 7 => 9, 8 => 8, 9 => 0, 10 => 9, :frame10_extra1 => 8 }
  @frame_scores3 = { 1 => 9, 2 => 9, 3 => 3, 4 => 10, 5 => 10, 6 => 10, 7 => 10, 8 => 8, 9 => 10, 10 => 10, :frame10_extra1 => 8 }
  @frame_marks3 = { 1 => :none, 2 => :none, 3 => :none, 4 => :spare, 5 => :spare, 6 => :spare, 7 => :spare, 8 => :none, 9 => :spare, 10 => :spare,
                    :frame10_extra1 => :none }
  @base_score3 = 89
  @spare_bonus3 = 41
  @strike_bonus3 = 0
  @total_score3 = 130

  # ケース４：ストライク有り、スペア無し、10フレームでボーナス投球有り
  @argv4 = ['X,X,X,X,X,X,X,X,X,X,X,X']
  @results_i4 = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
  @results_s_offset4 = %w[X dummy X dummy X dummy X dummy X dummy X dummy X dummy X dummy X dummy X
                          dummy X dummy X dummy]
  @frame_1st_shots4 = { 1 => 10, 2 => 10, 3 => 10, 4 => 10, 5 => 10, 6 => 10, 7 => 10, 8 => 10, 9 => 10, 10 => 10, :frame10_extra1 => 10,
                        :frame10_extra2 => 10 }
  @frame_scores4 = { 1 => 10, 2 => 10, 3 => 10, 4 => 10, 5 => 10, 6 => 10, 7 => 10, 8 => 10, 9 => 10, 10 => 10, :frame10_extra1 => 10, :frame10_extra2 => 10 }
  @frame_marks4 = { 1 => :X, 2 => :X, 3 => :X, 4 => :X, 5 => :X, 6 => :X, 7 => :X, 8 => :X, 9 => :X, 10 => :X, :frame10_extra1 => :X, :frame10_extra2 => :X }
  @base_score4 = 100
  @spare_bonus4 = 0
  @strike_bonus4 = 200
  @total_score4 = 300

  class << self
    attr_reader :argv1, :argv2, :argv3, :argv4,
                :results_i1, :results_i2, :results_i3, :results_i4,
                :results_s_offset1, :results_s_offset2, :results_s_offset3, :results_s_offset4,
                :frame_1st_shots1, :frame_1st_shots2, :frame_1st_shots3, :frame_1st_shots4,
                :frame_scores1, :frame_scores2, :frame_scores3, :frame_scores4,
                :frame_marks1, :frame_marks2, :frame_marks3, :frame_marks4,
                :base_score1, :base_score2, :base_score3, :base_score4,
                :spare_bonus1, :spare_bonus2, :spare_bonus3, :spare_bonus4,
                :strike_bonus1, :strike_bonus2, :strike_bonus3, :strike_bonus4,
                :total_score1, :total_score2, :total_score3, :total_score4
  end
end
