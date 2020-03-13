require 'nokogiri'
require 'json'
require '/home/mishigami/Desktop/RubyROSTELE/rubyonrails/lesson4MshkiGami/converter/lib/readers/reader.rb'
# parse from string
class RssParse
  def initialize(data)
    @data = data
  end

  def parse
    xmlfeed = Nokogiri::XML(data)
    doc = xmlfeed.xpath('//item')
    result = []
      doc.each do |el|
        result << {
          guid: el.at('guid').text,
          title: el.at('title').text,
          links: el.at('link').text,
          description: el.at('description').text,
          pub_date: el.at('pubDate').text,
          enclosure: el.at('enclosure').text,
          category: el.at('category').text
              }
      end
    result
  end
end

# test
#object = Reader.new("test.xml")
#texts = object.read
#var = RssParse.new(texts).parse
#puts obj_json = JSON.pretty_generate(var)