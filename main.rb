class Main
  def initialize(options)
    @input = options[:input]
    @output = options[:output]
    @sort = options[:sort]
  end

  def run
    data = Reader.read(@input)
    parsed_data = Parser.parse(data)
    convert_data = Converter.new(@output)
    convert_data.convert(parsed_data)
  end
end


#'https://lenta.ru/rss'
#'https://rss.dw.com/atom/rss-ru-news'
#'./test/fixtures/file1.txt'
