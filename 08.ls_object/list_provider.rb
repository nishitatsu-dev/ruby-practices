# frozen_string_literal: true

class ListProvider
  def initialize(path, options)
    Dir.chdir(path)
    @files = Dir.glob(*select_element(options))
    @options = options
  end

  def files
    @options[:r] ? @files.reverse : @files
  end

  private

  def select_element(options)
    options[:a] ? ['*', File::FNM_DOTMATCH] : ['*']
  end
end
