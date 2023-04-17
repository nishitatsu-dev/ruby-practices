# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../list_provider'

# 目次
# ①オプション無しの出力値__files
# ②オプション「a」「r」有りの出力値__files
# NOTE - 今回test_sampleフォルダはアップロードしていない

class ListProviderTest < Minitest::Test
  # def setup
  #   @path = './test/test_sample'
  #   @files = ['sample_dir', 'sample_file.md', 'sample_sticky_t_dir', 'sample_sticky_tt_dir', 'slink_sample_dir', 'slink_sample_file.md']
  #   @files_all = ['.', '.DS_Store', 'sample_dir', 'sample_file.md', 'sample_sticky_t_dir', 'sample_sticky_tt_dir', 'slink_sample_dir', 'slink_sample_file.md']
  # end

  # def teardown
  #   Dir.chdir('../..')
  # end

  # def test_①オプション無しの出力値__files
  #   options = {}
  #   list = ListProvider.new(@path, options)
  #   assert_equal @files, list.files
  # end

  # def test_②オプション「a」「r」有りの出力値__files
  #   options = { a: true, r: true }
  #   list = ListProvider.new(@path, options)
  #   assert_equal @files_all.reverse, list.files
  # end
end
