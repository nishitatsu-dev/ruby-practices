# frozen_string_literal: true

require_relative 'file_details'

class FormOptionLong
  attr_reader :lines

  def initialize(files)
    @lines = []
    block = 0
    calc_text_field_width(files)
    files.each do |file|
      fd = FileDetails.new(file)
      type = fd.details[:type]
      permission = fd.details[:permission]
      link = fd.details[:link].rjust(@widths[:link]).insert(-1, ' ')
      user = fd.details[:user].ljust(@widths[:user])
      group = fd.details[:group].ljust(@widths[:group])
      size = fd.details[:size].rjust(@widths[:size])
      month = fd.details[:month].rjust(3)
      day = fd.details[:day].rjust(3)
      time = fd.details[:time].rjust(6)
      name = fd.details[:name]
      @lines << type + permission + link + user + group + size + month + day + time + name
      block += fd.details[:block]
    end
    @lines.unshift("total #{block}")
  end

  private

  def calc_text_field_width(files)
    lengths = { link: [], user: [], group: [], size: [] }
    files.each do |n|
      state = File.lstat(n)
      lengths[:link] << state.nlink.to_s.length
      lengths[:user] << Etc.getpwuid(state.uid).name.length
      lengths[:group] << Etc.getgrgid(state.gid).name.length
      lengths[:size] << state.size.to_s.length
    end
    @widths = {}
    @widths[:link] = 1 + lengths[:link].max
    @widths[:user] = 2 + lengths[:user].max
    @widths[:group] = 1 + lengths[:group].max
    @widths[:size] = 1 + lengths[:size].max
  end
end
