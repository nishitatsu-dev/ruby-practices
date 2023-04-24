# frozen_string_literal: true

class FileDetails
  attr_reader :details

  FILE_MODE = { '7' => 'rwx',
                '6' => 'rw-',
                '5' => 'r-x',
                '4' => 'r--',
                '3' => '-wx',
                '2' => '-w-',
                '1' => '--x',
                '0' => '---' }.freeze

  def initialize(file)
    state = File.lstat(file)
    @details = {}
    @details[:type] = (state.ftype[0] == 'f' ? '-' : state.ftype[0])
    @details[:permission] = build_permission_with_stickybit(state)
    @details[:link] = state.nlink.to_s
    @details[:user] = Etc.getpwuid(state.uid).name
    @details[:group] = Etc.getgrgid(state.gid).name
    @details[:size] = state.size.to_s
    @details[:month] = state.mtime.month.to_s
    @details[:day] = state.mtime.day.to_s
    @details[:time] = state.mtime.strftime('%R')
    @details[:name] = (state.symlink? ? " #{file} -> #{File.readlink(file)}" : " #{file}")
    @details[:block] = state.blocks
  end

  private

  def build_permission_with_stickybit(state)
    mode = state.mode.to_s(8)
    permission = mode[-3, 3].chars.map { |n| FILE_MODE[n] }.join
    if mode[-4] != '1'
      permission
    elsif permission[-1] == '-'
      permission.chop << 'T'
    else # permission[-1] == 'x'
      permission.chop << 't'
    end
  end
end
