require 'nokogiri'
require '../readers/link_reader'

module RssParser
   def self.parse(data)
     result = []
 
     doc = Nokogiri::XML(data)
     doc.xpath("//rss/channel/item").each do |item|
       result << {guid: item.at('guid').text,
         title: item.at('title').text,
         links: item.at('link').text,
         description: item.at('description').text,
         pubDate: item.at('pubDate').text,
         enclosure: item.at('enclosure').text,
         category: item.at('category').text
        }
      end
      return result
   end
end

#obj = LinkReader.read('https://lenta.ru/rss')
#result = RssParser.parse(obj)
#puts result
