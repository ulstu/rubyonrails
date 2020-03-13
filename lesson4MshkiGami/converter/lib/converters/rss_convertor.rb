require 'json'
require 'nokogiri'
require 'require_all'
require '/home/mishigami/Desktop/RubyROSTELE/rubyonrails/lesson4MshkiGami/converter/lib/readers/reader.rb'
require '/home/mishigami/Desktop/RubyROSTELE/rubyonrails/lesson4MshkiGami/converter/lib/parsers/rss_parser.rb'

class RssConvertor
  def initialize(convert_data)
    @convert_data = convert_data
  end

  def convert
    result_rss = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\n"
    convert_data.each do |el|
      result_rss += "<item>\n"
      result_rss += '<guid>' + el[:guid] + "</guid>\n"
      result_rss += '<title>' + el[:title] + "</title>\n"
      result_rss += '<link>' + el[:links] + "</link>\n"
      result_rss += '<description>' + el[:description] + '</description>'
      result_rss += '<pubDate>' + el[:pub_date] + "</pubDate>\n"
      result_rss += '<enclosure>' + el[:enclosure] + "</enclosure>\n"
      result_rss += '<category> ' + el[:category] + "</category>\n"
      result_rss += '</item>'
    end
    result_rss
  end
end

# test
# object = Reader.new("test.xml")
# texts = object.read
# var = RssParse.new(texts).parse
# puts asd =  ConvertToRSS.new(var).convert_to_rss