# frozen_string_literal: true

class TestValue
  # ケース１：ストライク無し、スペア無し、10フレームでボーナス投球無し
  @argv1 = ['0,9,1,5,0,0,0,0,5,0,6,0,7,0,5,1,8,1,0,4']
  @results_x1 = [0, 9, 1, 5, 0, 0, 0, 0, 5, 0, 6, 0, 7, 0, 5, 1, 8, 1, 0, 4]
  @results_i1 = [0, 9, 1, 5, 0, 0, 0, 0, 5, 0, 6, 0, 7, 0, 5, 1, 8, 1, 0, 4]
  @frames_x1 = [0, 9, 1, 5, 0, 0, 0, 0, 5, 0, 6, 0, 7, 0, 5, 1, 8, 1, 0, 4]
  @frames_i1 = [0, 9, 1, 5, 0, 0, 0, 0, 5, 0, 6, 0, 7, 0, 5, 1, 8, 1, 0, 4]
  @subtotals_x1 = [9, 6, 0, 0, 5, 6, 7, 6, 9, 4]
  @base_score1 = 52
  @spare_bonus1 = 0
  @strike_bonus1 = 0
  @total_score1 = 52

  # ケース２：ストライク有り、スペア有り、10フレームでボーナス投球無し
  @argv2 = ['6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,0,0']
  @results_x2 = [6, 3, 9, 0, 0, 3, 8, 2, 7, 3, 'X', 9, 1, 8, 0, 'X', 'X', 0, 0]
  @results_i2 = [6, 3, 9, 0, 0, 3, 8, 2, 7, 3, 10, 9, 1, 8, 0, 10, 10, 0, 0]
  @frames_x2 = [6, 3, 9, 0, 0, 3, 8, 2, 7, 3, 'X', '-', 9, 1, 8, 0, 'X', '-', 'X', '-', 0, 0]
  @frames_i2 = [6, 3, 9, 0, 0, 3, 8, 2, 7, 3, 10, 0, 9, 1, 8, 0, 10, 0, 10, 0, 0, 0]
  @subtotals_x2 = [9, 9, 3, 10, 10, 'X-', 10, 8, 'X-', 'X-']
  @base_score2 = 89
  @spare_bonus2 = 25
  @strike_bonus2 = 20
  @total_score2 = 134

  # ケース３：ストライク無し、スペア有り、10フレームでボーナス投球有り
  @argv3 = ['6,3,9,0,0,3,8,2,7,3,0,10,9,1,8,0,0,10,9,1,8']
  @results_x3 = [6, 3, 9, 0, 0, 3, 8, 2, 7, 3, 0, 10, 9, 1, 8, 0, 0, 10, 9, 1, 8]
  @results_i3 = [6, 3, 9, 0, 0, 3, 8, 2, 7, 3, 0, 10, 9, 1, 8, 0, 0, 10, 9, 1, 8]
  @frames_x3 = [6, 3, 9, 0, 0, 3, 8, 2, 7, 3, 0, 10, 9, 1, 8, 0, 0, 10, 9, 1, 8]
  @frames_i3 = [6, 3, 9, 0, 0, 3, 8, 2, 7, 3, 0, 10, 9, 1, 8, 0, 0, 10, 9, 1, 8]
  @subtotals_x3 = [9, 9, 3, 10, 10, 10, 10, 8, 10, 10]
  @base_score3 = 89
  @spare_bonus3 = 41
  @strike_bonus3 = 0
  @total_score3 = 130

  # ケース４：ストライク有り、スペア無し、10フレームでボーナス投球有り
  @argv4 = ['X,X,X,X,X,X,X,X,X,X,X,X']
  @results_x4 = %w[X X X X X X X X X X X X]
  @results_i4 = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
  @frames_x4 = ['X', '-', 'X', '-', 'X', '-', 'X', '-', 'X', '-', 'X', '-', 'X', '-', 'X', '-', 'X', '-', 'X', '-', 'X', '-', 'X', '-']
  @frames_i4 = [10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0]
  @subtotals_x4 = ['X-', 'X-', 'X-', 'X-', 'X-', 'X-', 'X-', 'X-', 'X-', 'X-']
  @base_score4 = 100
  @spare_bonus4 = 0
  @strike_bonus4 = 200
  @total_score4 = 300

  class << self
    attr_reader :argv1, :argv2, :argv3, :argv4,
                :results_i1, :results_i2, :results_i3, :results_i4,
                :results_x1, :results_x2, :results_x3, :results_x4,
                :frames_x1, :frames_x2, :frames_x3, :frames_x4,
                :frames_i1, :frames_i2, :frames_i3, :frames_i4,
                :subtotals_x1, :subtotals_x2, :subtotals_x3, :subtotals_x4,
                :total_score1, :total_score2, :total_score3, :total_score4
  end
end
