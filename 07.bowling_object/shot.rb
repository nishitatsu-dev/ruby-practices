# frozen_string_literal: true

class Shot
  attr_reader :results_x, :results_i

  def initialize(argv)
    results = argv[0].split(',')
    if results.include?('X')
      @results_x = results.map { |n| n == 'X' ? 'X' : n.to_i }
      @results_i = @results_x.map { |n| n == 'X' ? 10 : n }
    else
      @results_x = results.map(&:to_i)
      @results_i = @results_x
    end
  end
end
