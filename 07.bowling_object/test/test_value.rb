# frozen_string_literal: true

class TestValue
  # ケース１：ストライク無し、スペア無し、10フレームでボーナス投球無し
  @argv1 = ['0,9,1,5,0,0,0,0,5,0,6,0,7,0,5,1,8,1,0,4']
  @frame_scores1 = [9, 6, 0, 0, 5, 6, 7, 6, 9, 4]
  @base_score1 = 52
  @spare_bonus1 = 0
  @strike_bonus1 = 0
  @total_score1 = 52

  # ケース２：ストライク有り、スペア有り、10フレームでボーナス投球２回有り
  @argv2 = ['6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,0,10']
  @frame_scores2 = [9, 9, 3, 10, 10, 10, 10, 8, 10, 10, 10]
  @base_score2 = 89
  @spare_bonus2 = 25
  @strike_bonus2 = 30
  @total_score2 = 144

  # ケース３：ストライク無し、スペア有り、10フレームでボーナス投球１回有り
  @argv3 = ['6,3,9,0,0,3,8,2,7,3,0,10,9,1,8,0,0,10,9,1,8']
  @frame_scores3 = [9, 9, 3, 10, 10, 10, 10, 8, 10, 10, 8]
  @base_score3 = 89
  @spare_bonus3 = 41
  @strike_bonus3 = 0
  @total_score3 = 130

  # ケース４：ストライク有り、スペア無し、10フレームでボーナス投球有り
  @argv4 = ['X,X,X,X,X,X,X,X,X,X,X,X']
  @frame_scores4 = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
  @base_score4 = 100
  @spare_bonus4 = 0
  @strike_bonus4 = 200
  @total_score4 = 300

  class << self
    attr_reader :argv1, :argv2, :argv3, :argv4,
                :frame_scores1, :frame_scores2, :frame_scores3, :frame_scores4,
                :base_score1, :base_score2, :base_score3, :base_score4,
                :spare_bonus1, :spare_bonus2, :spare_bonus3, :spare_bonus4,
                :strike_bonus1, :strike_bonus2, :strike_bonus3, :strike_bonus4,
                :total_score1, :total_score2, :total_score3, :total_score4
  end
end
