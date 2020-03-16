# frozen_string_literal: true

require 'minitest/autorun'
require 'nokogiri'
require './lib/readers/file_reader'
require './lib/parsers/rss_parser'

class RssParserTest < MiniTest::Test
  def test_parse
    file = FileReader.read('./test/fixtures/file_test.rss')
    data = RssParser.parse(file)
    assert_equal 'https://lenta.ru/news/2020/03/16/ural/', data[0][:guid]
  end
end
