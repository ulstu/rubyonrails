class RssParserTest# < Minitest(?)

  def test_parse_file
    file = File.open("fixtures/file.rss")
    data = RssParser.parse(file)

    assert_equal "Заголовок", data[0]['title']
  end

end
