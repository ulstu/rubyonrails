# frozen_string_literal: true

require 'nokogiri'

# Module for rss parsing
module RssParser
  def self.parse(input)
    xml_doc = Nokogiri::XML(input)
    xml_doc.remove_namespaces!
    result = {
      head: channel_parse(xml_doc),
      content: items_parse(xml_doc)
    }
    result
  end

  def self.can_parse?(input)
    unless (input =~ /rss version/).nil?
      xml_doc = Nokogiri::XML(input)
      return true unless xml_doc.xpath('//channel/item').nil?
    end
    false
  end

  def self.channel_parse(xml_doc)
    {
      language: xml_doc.at_css('channel language').content.strip,
      title: xml_doc.at_css('channel title').content.strip,
      description: xml_doc.at_css('channel description').content.strip,
      link: xml_doc.at_css('channel link').content.strip,
      image: xml_doc.at_css('channel image url').content.strip
    }
  end

  def self.items_parse(xml_doc)
    result = []
    xml_doc.xpath('//item').each do |item|
      result.push(
        {
          guid: item.at_css('guid').content.strip,
          title: item.at_css('title').content.strip,
          link: item.at_css('link').content.strip,
          description: item.at_css('description').content.strip,
          date: item.at_css('pubDate').content.strip,
          enclosure: item.at_css('enclosure').get_attribute('url').strip,
          category: item.at_css('category').content.strip
        }
      )
    end
    result
  end
end
