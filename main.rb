# frozen_string_literal: true

class Main
  def initialize(options)
    @input = options[:input]
    @output = options[:output]
    @sort = options[:sort]
  end

  def run
    data = BaseReader.read(@input)
    parsed_data = BaseParser.parse(data)
    convert_data = BaseConverter.new(@output)
    convert_data.convert(parsed_data)
  end
end

# 'https://lenta.ru/rss'
# 'https://rss.dw.com/atom/rss-ru-news'
# './test/fixtures/file1.txt'
