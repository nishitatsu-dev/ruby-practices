# frozen_string_literal: true

require_relative 'file_detail'

class OptionLongFormatter
  def initialize(files)
    @files_with_detail = files.map { |file| FileDetail.new(file) }
  end

  def lines
    @lines = []
    make_file_lines
    total_block = @files_with_detail.inject(0) { |result, n| result + n.block }
    @lines.unshift("total #{total_block}")
  end

  private

  def make_file_lines
    length_link = calc_max_length(:link)
    length_user = calc_max_length(:user)
    length_group = calc_max_length(:group)
    length_size = calc_max_length(:size)
    @files_with_detail.each do |n|
      line = n.type.to_s
      line += "#{n.permission} "
      line += "#{n.link.rjust(length_link)} "
      line += "#{n.user.ljust(length_user)}  "
      line += "#{n.group.ljust(length_group)}  "
      line += "#{n.size.rjust(length_size)} "
      line += "#{n.month.rjust(2)} "
      line += "#{n.day.rjust(2)} "
      line += "#{n.time.rjust(5)} "
      line += n.name.to_s
      @lines << line
    end
  end

  def calc_max_length(item)
    @files_with_detail.map { |n| n.method(item).call.length }.max
  end
end
