require 'json'
require 'nokogiri'
require 'require_all'
require '/home/mishigami/Desktop/RubyROSTELE/rubyonrails/lesson4MshkiGami/converter/lib/readers/reader.rb'
require '/home/mishigami/Desktop/RubyROSTELE/rubyonrails/lesson4MshkiGami/converter/lib/parsers/rss_parser.rb'

# Convert JSON
class JsonConvertor
  def initialize(convert_data)
    @convert_data = convert_data
  end

  def convert
    JSON.pretty_generate(convert_data)
  end
end

# test
# object = Reader.new("test.xml")
# texts = object.read
# var = RssParse.new(texts).parse
# uts var1 = ConvertToJSON.new(var).data_to_json