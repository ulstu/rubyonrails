# frozen_string_literal: true

require 'minitest/autorun'
require 'open-uri'
# Module for testing OptionsParser module
class FileReaderTest < Minitest::Test
  def setup
    @file_reader = FileReader
    @file_path = Dir.pwd + '/tests/Readers/test_files/'
  end

  # need fix hardcode path
  def test_file1
    assert_equal 'test file with extension', @file_reader.read(@file_path + 'file1.txt')
  end

  # need fix hardcode path
  def test_file2
    assert_equal 'test file without extension', @file_reader.read(@file_path + 'file2')
  end

  # need fix hardcode path
  def test_empty_file
    assert_equal '', @file_reader.read(@file_path + 'empty_file.txt')
  end
end
