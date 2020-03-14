# frozen_string_literal: true

require 'nokogiri'

# desc
module RssParser
  def self.parse(input)
    xml_doc = Nokogiri::XML(input)
    xml_doc.remove_namespaces!
    result = []
    xml_doc.xpath('//item').each do |item|
      result.push(
        {
          guid: item.at_css('guid').content.strip,
          title: item.at_css('title').content.strip,
          link: item.at_css('link').content.strip,
          description: item.at_css('description').content.strip,
          pubDate: item.at_css('pubDate').content.strip,
          enclosure: item.at_css('enclosure').get_attribute('url').strip,
          category: item.at_css('category').content.strip
        }
      )
    end
    result
  end

  def self.can_parse?(input)
    unless (input =~ /rss version/).nil?
      xml_doc = Nokogiri::XML(input)
      return true unless xml_doc.xpath('//channel/item').nil?
    end
    false
  end
end
