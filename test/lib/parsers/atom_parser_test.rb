# frozen_string_literal: true

require 'minitest/autorun'
require 'nokogiri'
require './lib/readers/file_reader'
require './lib/parsers/atom_parser'

class AtomParserTest < MiniTest::Test
  def test_parse
    file = FileReader.read('./test/fixtures/file_test.atom')
    data = AtomParser.parse(file)
    assert_equal 'tag:dw.com,2020:52793074', data[0][:id]
  end
end
