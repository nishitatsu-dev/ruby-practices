#! /usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
class LineWordByte
  def self.line_word_byte(text, options, paths)
    new.line_word_byte(text, options, paths)
  end

  def line_word_byte(text, options, paths)
    results = []
    case paths.size
    when 0
      results << select_display_format(text, options, path: '')[0]
    when 1
      path0 = paths[0]
      text = File.read(path0)
      results << select_display_format(text, options, path: path0)[0]
    else
      counts = []
      paths.each do |n|
        text = File.read(n)
        result, each_counts = select_display_format(text, options, path: n)
        results << result
        counts << each_counts
      end
      results << calc_total(counts)
    end
    results.join("\n")
  end

  def select_display_format(text, options, path: '')
    options[:l] ? line_form(text, path) : arrange_form(text, path)
  end

  LENGTH = 7
  def calc_total(counts)
    sums = counts.transpose.map { |a| a.inject(:+) }
    answer = sums.inject('') { |abc, a| abc + " #{a.to_s.rjust(LENGTH)}" }
    "#{answer} total"
  end

  def line_form(text, path)
    each_counts = [count_line(text)]
    result = " #{each_counts[0].to_s.rjust(LENGTH)}" + " #{path}"
    [result, each_counts]
  end

  def arrange_form(text, path)
    each_counts = [count_line(text), count_word(text), count_byte(text)]
    result = " #{each_counts[0].to_s.rjust(LENGTH)} #{each_counts[1].to_s.rjust(LENGTH)} #{each_counts[2].to_s.rjust(LENGTH)}" + " #{path}"
    [result, each_counts]
  end

  def count_line(text)
    n_line = text.count("\n")
    n_line += 1 if /[^\n]\z/.match?(text)
    n_line
  end

  def count_word(text)
    n_word = text.scan(/\s+/).length
    n_word += 1 if /[^\s]\z/.match?(text) # 動作確認、書式確認
    n_word -= 1 if /\A\s/.match?(text) # 動作確認、書式確認
    n_word
  end

  def count_byte(text)
    text.bytesize
  end
end

if __FILE__ == $PROGRAM_NAME
  options = {}
  ARGV.options do |opt|
    opt.on('-l', '行数を表示') { |x| options[:l] = x }
    opt.parse!(ARGV)
  end

  text = if ARGV.empty?
           ARGF.read
         else
           ''
         end

  puts LineWordByte.line_word_byte(text, options, ARGV)
end
