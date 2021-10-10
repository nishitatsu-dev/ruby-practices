#! /usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require 'etc'

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
    select_display_format(options, lists_ordered)
  end

  def apply_a(options)
    options[:a] ? ['*', File::FNM_DOTMATCH] : ['*']
  end

  def apply_r(options, lists)
    options[:r] ? lists.reverse : lists
  end

  def select_display_format(options, lists_ordered)
    options[:l] ? apply_l(lists_ordered) : arrange_form(lists_ordered)
  end

  def apply_l(lists_ordered)
    calc_block_and_word_length(lists_ordered)
    puts "total #{@total_block}"
    lists_ordered.each do |file|
      fs = File.lstat(file)
      type = (fs.ftype[0] == 'f' ? '-' : fs.ftype[0])
      file_mode = { '7' => 'rwx', '6' => 'rw-', '5' => 'r-x', '4' => 'r--', '3' => '-wx', '2' => '-w-', '1' => '--x', '0' => '---' }
      mode = fs.mode.to_s(8)
      permission = mode[-3, 3].chars.map { |n| file_mode[n] }.join
      permission_with_stickybit = modify_by_stikybit_condition(mode, permission)
      xattr = (condition_for_xattr(file, type, permission) ? '@' : ' ')
      link = fs.nlink.to_s.rjust(@full_length_of_link).insert(-1, ' ')
      user = Etc.getpwuid(fs.uid).name.ljust(@full_length_of_user)
      group = Etc.getgrgid(fs.gid).name.ljust(@full_length_of_group)
      size = fs.size.to_s.rjust(@full_length_of_size)
      month = fs.mtime.month.to_s.rjust(3)
      day = fs.mtime.day.to_s.rjust(3)
      time = fs.mtime.strftime('%R').rjust(6)
      name = (fs.symlink? ? " #{file} -> #{File.readlink(file)}" : " #{file}")
      puts(type + permission_with_stickybit + xattr + link + user + group + size + month + day + time + name)
    end
  end

  def calc_block_and_word_length(lists_ordered)
    blocks = []
    lengths_of_link = []
    lengths_of_user = []
    lengths_of_group = []
    lengths_of_size = []
    lists_ordered.each do |n|
      fs = File.lstat(n)
      blocks << fs.blocks
      lengths_of_link << fs.nlink.to_s.length
      lengths_of_user << Etc.getpwuid(fs.uid).name.length
      lengths_of_group << Etc.getgrgid(fs.gid).name.length
      lengths_of_size << fs.size.to_s.length
    end
    @total_block = blocks.sum
    margin1 = 1
    margin2 = 2
    @full_length_of_link = margin1 + lengths_of_link.max
    @full_length_of_user = margin2 + lengths_of_user.max
    @full_length_of_group = margin1 + lengths_of_group.max
    @full_length_of_size = margin1 + lengths_of_size.max
  end

  def modify_by_stikybit_condition(mode, permission)
    if mode[-4] != '1'
      permission
    elsif permission[-1] == '-'
      permission.chop << 'T'
    else # permission[-1] == 'x'
      permission.chop << 't'
    end
  end

  def condition_for_xattr(file, type, permission)
    type != 'l' && permission != '---------' && `xattr #{file.gsub(/ /, '\ ')}` =~ /^com.apple/
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
    opt.on('-l', '詳細情報を表示') { |x| options[:l] = x }
    opt.parse!(ARGV)
  end
  ListSegment.list_segment(ARGV, options)
end
