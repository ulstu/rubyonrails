require "minitest/autorun"
require "minitest/pride"
require "../../../lib/parsers/atom_parser"

class RssParserTest < MiniTest
 
    def test_parse_file
      file = File.open('fixtures/file1')
      data = AtomParser.parse(file)
      
      assert_equal 'Заголовок', data[0]['titie']
    end
end