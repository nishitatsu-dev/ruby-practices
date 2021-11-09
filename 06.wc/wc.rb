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
      results << select_display_format(text, options, path: '').rstrip
    when 1
      path0 = paths[0]
      text = File.read(path)
      results << select_display_format(text, options, path: path0)
    else
      counts = []
      paths.each do |n|
        text = File.read(n)
        results << select_display_format(text, options, path: n)
        counts << @counts
      end
      sums = counts.transpose.map { |a| a.inject(:+) }
      answer = sums.inject('') { |abc, a| abc + " #{a.to_s.rjust(LENGTH)}" }
      results << "#{answer} total"
    end
    results.join("\n")
  end

  def select_display_format(text, options, path: '')
    options[:l] ? line_form(text, path) : arrange_form(text, path)
  end

  LENGTH = 7
  def line_form(text, path)
    @counts = [count_line(text)]
    " #{@counts[0].to_s.rjust(LENGTH)}" + " #{path}"
  end

  def arrange_form(text, path)
    @counts = [count_line(text), count_word(text), count_byte(text)]
    " #{@counts[0].to_s.rjust(LENGTH)} #{@counts[1].to_s.rjust(LENGTH)} #{@counts[2].to_s.rjust(LENGTH)}" + " #{path}"
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
