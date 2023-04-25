# frozen_string_literal: true

require_relative 'normal_formatter'
require_relative 'option_long_formatter'

class DisplayFormatter
  attr_reader :lines

  def initialize(files, options)
    form = options[:l] ? OptionLongFormatter.new(files) : NormalFormatter.new(files)
    @lines = form.lines
  end
end
