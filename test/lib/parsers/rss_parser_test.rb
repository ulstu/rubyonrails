# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require '../../../lib/parsers/rss_parser'

class RssParserTest < MiniTest::Test
  def test_parse_file
    file = File.open('https://lenta.ru/rss')
    data = RssParser.parse(file)
    assert_equal 'https://lenta.ru/news/2020/03/05/okkosport/', data[0]['guid']
  end
end
