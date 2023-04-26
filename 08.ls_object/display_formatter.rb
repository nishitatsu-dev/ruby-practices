# frozen_string_literal: true

require_relative 'normal_formatter'
require_relative 'option_long_formatter'

class DisplayFormatter
  def initialize(files, options)
    @form = options[:l] ? OptionLongFormatter.new(files) : NormalFormatter.new(files)
  end

  def lines
    @form.lines
  end
end
