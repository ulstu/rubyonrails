require "minitest/autorun"
require "minitest/pride"
require "../../../lib/parsers/rss_parser"

class RssParserTest < MiniTest::Test
 
  def test_parse_file
    file = File.open('https://lenta.ru/rss')
    data = RssParser.parse(file)

    assert_equal 'Заголовок', data[0]['guid']
  end
end