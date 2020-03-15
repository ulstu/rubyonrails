require 'require_all'
require_all '../lib'
require 'open-uri'
require 'nokogiri'
require 'json'

class Main
  def initialize(options)
    @input = options[:input]
    @ouput = options[:ouput]
    @sort = options[:sort]
  end

  def run
  puts @input
    data = LinkReader.read(@input)
    parsed_data = RssParser.parse(data)
    convert_data = JsonConverter.convert(parsed_data)
    
  end
end
