require '../readers/link_reader'
require '../parsers/rss_parser'

module JsonConverter
  def self.convert(data)
    puts JSON.dump(data)

    File.open("../../test/fixtures/file1", "w") do |file| 
      file.puts result
    end
  end
end

obj = LinkReader.read('https://lenta.ru/rss')
data = RssParser.parse(obj)
result = JsonConverter.convert(data)