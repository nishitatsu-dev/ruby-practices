# frozen_string_literal: true

require_relative 'file_detail'

class OptionLongFormatter
  attr_reader :lines

  def initialize(files)
    files_with_detail = []
    files.each do |file|
      files_with_detail << FileDetail.new(file)
    end

    @lines = []
    @block = 0
    calc_text_field_width(files_with_detail)
    make_long_format_lines(files_with_detail)
    @lines.unshift("total #{@block}")
  end

  private

  def calc_text_field_width(files_with_detail)
    lengths = { link: [], user: [], group: [], size: [] }
    files_with_detail.each do |n|
      lengths[:link] << n.link.length
      lengths[:user] << n.user.length
      lengths[:group] << n.group.length
      lengths[:size] << n.size.length
    end
    @widths = {}
    @widths[:link] = 1 + lengths[:link].max
    @widths[:user] = 2 + lengths[:user].max
    @widths[:group] = 1 + lengths[:group].max
    @widths[:size] = 1 + lengths[:size].max
  end

  def make_long_format_lines(files_with_detail)
    files_with_detail.each do |n|
      type = n.type
      permission = n.permission
      link = n.link.rjust(@widths[:link]).insert(-1, ' ')
      user = n.user.ljust(@widths[:user])
      group = n.group.ljust(@widths[:group])
      size = n.size.rjust(@widths[:size])
      month = n.month.rjust(3)
      day = n.day.rjust(3)
      time = n.time.rjust(6)
      name = n.name
      @lines << type + permission + link + user + group + size + month + day + time + name
      @block += n.block
    end
  end
end
