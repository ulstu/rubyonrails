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

  PARSERS = ['JsonParser', 'AtomParser', 'RssParser']

  def run
  puts @input
    data = LinkReader.read(@input)

    #parserName = ''
   # PARSERS = ['JsonParser', 'AtomParser', 'RssParser']
   # PARSERS.each do |parser_name|
   #   parserName = parser_name if Module.const_get(parser_name).can_parse?(data)
    #end

    
    str = BaseParser.named(data) 
    parsed_data = BaseParser.parse(data, str);

    convert_data = AtomConverter.convert(parsed_data)
    
  end
end

