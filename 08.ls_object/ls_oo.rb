# frozen_string_literal: true

require 'optparse'
require 'etc'
require_relative 'list_provider'
require_relative 'display_formatter'

class LSManager
  def self.run_ls(argv, options)
    files = ListProvider.new(argv[0], options).files
    form = DisplayFormatter.new(files, options)
    form.lines.each { |n| puts n }
  end
end

if __FILE__ == $PROGRAM_NAME
  options = {}
  ARGV.options do |opt|
    opt.on('-a', '全てのファイルとフォルダを表示（ドット(.)で始まるものを含む）') { |x| options[:a] = x }
    opt.on('-r', '逆順で表示') { |x| options[:r] = x }
    opt.on('-l', '詳細情報を表示') { |x| options[:l] = x }
    opt.parse!(ARGV)
  end
  LSManager.run_ls(ARGV, options)
end
