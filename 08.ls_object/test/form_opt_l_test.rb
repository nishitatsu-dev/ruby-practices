# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../form_opt_l'

# 目次
#  オプション「l」有りの出力値__initialize
# NOTE - 今回test_sampleフォルダはアップロードしていない

class FormOptLTest < Minitest::Test
  # def test_オプション「l」有りの出力値__initialize
  #   Dir.chdir('./test/test_sample')
  #   files = Dir.glob('*')
  #   form_opt_l = FormOptL.new(files)
  #   expected = ['total 8',
  #               'drwxr-xr-x 2 tatsu  staff  64  4 17 10:28 sample_dir',
  #               '-rw-r--r-- 1 tatsu  staff  91  4 17 10:57 sample_file.md',
  #               'drwxr-xr-t 2 tatsu  staff  64  4 17 10:28 sample_sticky_t_dir',
  #               'drwxr-xr-T 2 tatsu  staff  64  4 17 10:28 sample_sticky_tt_dir',
  #               'lrwxr-xr-x 1 tatsu  staff  29  4 17 10:32 slink_sample_dir -> ./test/test_sample/sample_dir',
  #               'lrwxr-xr-x 1 tatsu  staff  33  4 17 10:32 slink_sample_file.md -> ./test/test_sample/sample_file.md']
  #   assert_equal expected, form_opt_l.lines
  # end
end
