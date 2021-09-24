#! /usr/bin/env ruby
# frozen_string_literal: true

class ListSegment
  def self.list_segment(path_and_option)
    new.list_segment(path_and_option)
  end

  def list_segment(path_and_option)
    options = path_and_option.grep(/-/)
    paths = path_and_option - options

    unless paths.empty?
      raise ArgumentError, "無効なパスです:#{paths[0]}" unless File.exist?(paths[0])

      Dir.chdir(paths[0])
    end
    lists = Dir.glob('*')
    arrange_form(lists)
  end

  LINE = 3
  def arrange_form(lists)
    residue = lists.size % LINE
    number_of_dummy = if residue.zero?
                        0
                      else
                        LINE - residue
                      end
    lists_with_dummy = adjust_word_length(lists) + Array.new(number_of_dummy, '')
    row = lists_with_dummy.size / LINE
    lists_2dimension = []
    lists_with_dummy.each_slice(row) { |n| lists_2dimension << n }
    lists_2d_transposed = lists_2dimension.transpose
    lists_2d_transposed.each { |n| puts n.join }
  end

  def adjust_word_length(lists)
    margin = 3
    word_length = lists.map(&:length).max + margin
    lists.map { |n| n.ljust(word_length) }
  end
end

__FILE__ == $PROGRAM_NAME && ListSegment.list_segment(ARGV)
