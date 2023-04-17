# frozen_string_literal: true

class ListProvider
  attr_reader :files

  def initialize(path, options)
    Dir.chdir(path)
    files = Dir.glob(*select_element(options))
    @files = options[:r] ? files.reverse : files
  end

  private

  def select_element(options)
    options[:a] ? ['*', File::FNM_DOTMATCH] : ['*']
  end
end
