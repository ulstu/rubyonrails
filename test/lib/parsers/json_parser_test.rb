require "minitest/autorun"
require "minitest/pride"
require "../../../lib/parsers/json_parser"

class RssParserTest < MiniTest
 
    def test_parse_file
      file = File.open('fixtures/file1')
      data = JsonParser.parse(file)
  
      assert_equal 'Заголовок', data[0]['titie']
    end
end