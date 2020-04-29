# frozen_string_literal: true

# parse from string
class RssParser
  def self.parse(data)
    xmlfeed = Nokogiri::XML(data)
    doc = xmlfeed.xpath('//item')
    result = []
    doc.each do |el|
      result << {
        guid: el.at('guid').text,
        title: el.at('title').text,
        link: el.at('link').text,
        specification: el.at('description').text,
        date: el.at('pubDate').text,
        enclosure: el.at('enclosure').text,
        category: el.at('category').text
      }
    end
    result
  end

  def self.can_parse?(data)
    data.include?('rss')
  end
end
