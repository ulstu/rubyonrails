class RssParserTest < MiniTest
 
    def test_parse_file
      file = File.open('fixtures/file1')
      data = RssParser.parse(file)
  
      assert_equal 'Заголовок', data[0]['titie']
    end
  end