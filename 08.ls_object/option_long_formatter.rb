# frozen_string_literal: true

require_relative 'file_detail'

class OptionLongFormatter
  def initialize(files)
    @files_with_detail = files.map { |file| FileDetail.new(file) }
  end

  def lines
    lines = []
    block = 0
    length_link = calc_max_length(:link)
    length_user = calc_max_length(:user)
    length_group = calc_max_length(:group)
    length_size = calc_max_length(:size)
    @files_with_detail.each do |n|
      first_half = "#{n.type}#{n.permission} #{n.link.rjust(length_link)} #{n.user.ljust(length_user)}  #{n.group.ljust(length_group)}"
      second_half = "  #{n.size.rjust(length_size)} #{n.month.rjust(2)} #{n.day.rjust(2)} #{n.time.rjust(5)} #{n.name}"
      lines << first_half + second_half
      block += n.block
    end
    lines.unshift("total #{block}")
  end

  private

  def calc_max_length(item)
    lengths = @files_with_detail.map { |n| n.method(item).call.length }
    lengths.max
  end
end
