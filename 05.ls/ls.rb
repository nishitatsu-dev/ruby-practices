#! /usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

class ListSegment
  def self.list_segment(paths, options)
    new.list_segment(paths, options)
  end

  def list_segment(paths, options)
    unless paths.empty?
      raise ArgumentError, "無効なパスです:#{paths[0]}" unless File.exist?(paths[0])

      Dir.chdir(paths[0])
    end
    lists = Dir.glob(*apply_a(options))
    lists_ordered = apply_r(options, lists)
    arrange_form(lists_ordered)
  end

  def apply_a(options)
    options[:a] ? ['*', File::FNM_DOTMATCH] : ['*']
  end

  def apply_r(options, lists)
    options[:r] ? lists.reverse : lists
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

if __FILE__ == $PROGRAM_NAME
  options = {}
  ARGV.options do |opt|
    opt.on('-a', '全てのファイルとフォルダを表示（ドット(.)で始まるものを含む）') { |x| options[:a] = x }
    opt.on('-r', '逆順で表示') { |x| options[:r] = x }
    opt.parse!(ARGV)
  end
  ListSegment.list_segment(ARGV, options)
end
