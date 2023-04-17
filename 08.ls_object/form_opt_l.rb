# frozen_string_literal: true

class FormOptL
  attr_reader :lines

  FILE_MODE = { '7' => 'rwx', '6' => 'rw-', '5' => 'r-x', '4' => 'r--', '3' => '-wx', '2' => '-w-', '1' => '--x', '0' => '---' }.freeze
  def initialize(files)
    @lines = []
    calc_block_and_word_length(files)
    block = "total #{@total_block}"
    @lines << block

    files.each do |file|
      state = File.lstat(file)
      type = (state.ftype[0] == 'f' ? '-' : state.ftype[0])
      permission_with_stickybit = build_permission_with_stikybit(state)
      link = state.nlink.to_s.rjust(@length_for_link).insert(-1, ' ')
      user = Etc.getpwuid(state.uid).name.ljust(@length_for_user)
      group = Etc.getgrgid(state.gid).name.ljust(@length_for_group)
      size = state.size.to_s.rjust(@length_for_size)
      month = state.mtime.month.to_s.rjust(3)
      day = state.mtime.day.to_s.rjust(3)
      time = state.mtime.strftime('%R').rjust(6)
      name = (state.symlink? ? " #{file} -> #{File.readlink(file)}" : " #{file}")
      @lines << type + permission_with_stickybit + link + user + group + size + month + day + time + name
    end
  end

  private

  def calc_block_and_word_length(files)
    lengths = { link: 0, user: 0, group: 0, size: 0 }
    @total_block = files.inject(0) do |sum, n|
      state = File.lstat(n)
      lengths[:link] = [lengths[:link], state.nlink.to_s.length].max
      lengths[:user] = [lengths[:user], Etc.getpwuid(state.uid).name.length].max
      lengths[:group] = [lengths[:group], Etc.getgrgid(state.gid).name.length].max
      lengths[:size] = [lengths[:size], state.size.to_s.length].max
      sum + state.blocks
    end
    margin1 = 1
    margin2 = 2
    @length_for_link = margin1 + lengths[:link]
    @length_for_user = margin2 + lengths[:user]
    @length_for_group = margin1 + lengths[:group]
    @length_for_size = margin1 + lengths[:size]
  end

  def build_permission_with_stikybit(state)
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
