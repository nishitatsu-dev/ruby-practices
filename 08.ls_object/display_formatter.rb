# frozen_string_literal: true

require_relative 'form_normal'
require_relative 'form_opt_l'

class DisplayFormatter
  attr_reader :lines

  def initialize(files, options)
    form = options[:l] ? FormOptL.new(files) : FormNormal.new(files)
    @lines = form.lines
  end
end
