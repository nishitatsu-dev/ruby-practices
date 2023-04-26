# frozen_string_literal: true

class NormalFormatter
  attr_reader :lines

  LINE = 3
  def initialize(files)
    @files = files
  end
  
  def lines
    residue = @files.size % LINE
    number_of_dummy = residue.zero? ? 0 : LINE - residue
    files_with_dummy = adjust_word_length(@files) + Array.new(number_of_dummy, '')
    row = files_with_dummy.size / LINE
    files_2d_matrix = []
    files_with_dummy.each_slice(row) { |n| files_2d_matrix << n }
    files_2d_matrix.transpose.map(&:join)
  end

  private

  def adjust_word_length(files)
    margin = 4
    word_length = files.map(&:length).max + margin
    files.map { |n| n.ljust(word_length) }
  end
end
