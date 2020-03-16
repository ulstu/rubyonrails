# frozen_string_literal: true

require 'minitest/autorun'
require 'json'
require './lib/readers/file_reader'
require './lib/parsers/json_parser'

class JsonParserTest < MiniTest::Test
  def test_parse
    file = FileReader.read('./test/fixtures/file_test.json')
    data = JsonParser.parse(file)
    assert_equal 'https://lenta.ru/news/2020/03/05/okkosport/', data[0][:guid]
  end
end
