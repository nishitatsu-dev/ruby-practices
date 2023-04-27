# frozen_string_literal: true

class FileDetail
  FILE_MODE = { '7' => 'rwx',
                '6' => 'rw-',
                '5' => 'r-x',
                '4' => 'r--',
                '3' => '-wx',
                '2' => '-w-',
                '1' => '--x',
                '0' => '---' }.freeze

  def initialize(file)
    @file = file
    @state = File.lstat(file)
  end

  def type
    @state.ftype[0] == 'f' ? '-' : @state.ftype[0]
  end

  def permission
    mode = @state.mode.to_s(8)
    permission = mode[-3, 3].chars.map { |n| FILE_MODE[n] }.join
    if mode[-4] != '1'
      permission
    elsif permission[-1] == '-'
      permission.chop << 'T'
    else # permission[-1] == 'x'
      permission.chop << 't'
    end
  end

  def link
    @state.nlink.to_s
  end

  def user
    Etc.getpwuid(@state.uid).name
  end

  def group
    Etc.getgrgid(@state.gid).name
  end

  def size
    @state.size.to_s
  end

  def month
    @state.mtime.month.to_s
  end

  def day
    @state.mtime.day.to_s
  end

  def time
    @state.mtime.strftime('%R')
  end

  def name
    @state.symlink? ? "#{@file} -> #{File.readlink(@file)}" : @file.to_s
  end

  def block
    @state.blocks
  end
end
