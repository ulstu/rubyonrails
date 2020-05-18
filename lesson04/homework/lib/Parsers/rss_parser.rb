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
    xml_doc = Nokogiri::XML(input)
    input =~ /rss version/ && xml_doc.xpath('//channel/item')
  end

  def self.channel_parse(xml_doc)
    result = {}
    xml_doc.xpath('//channel').each do |ch|
      result[:language] = ch.at_css('language').content.strip\
       unless ch.at_css('language').nil?
      result[:title] = ch.at_css('title').content.strip\
       unless ch.at_css('title').nil?
      result[:description] = ch.at_css('description').content.strip\
       unless ch.at_css('description').nil?
      result[:link] = ch.at_css('link').content.strip\
       unless ch.at_css('link').nil?

      next if ch.at_css('image').nil?

      result[:image] = {}
      result[:image][:url] = ch.at_css('image url').content.strip\
       unless ch.at_css('image url').nil?
      result[:image][:title] = ch.at_css('image title').content.strip\
       unless ch.at_css('image title').nil?
      result[:image][:link] = ch.at_css('image link').content.strip\
       unless ch.at_css('image link').nil?
    end
    result
  end

  def self.items_parse(xml_doc)
    result = []
    xml_doc.xpath('//item').each do |item|
      items = {}
      items[:guid] = item.at_css('guid').content.strip\
       unless item.at_css('guid').nil?
      items[:title] = item.at_css('title').content.strip\
       unless item.at_css('title').nil?
      items[:link] = item.at_css('link').content.strip\
       unless item.at_css('link').nil?
      items[:description] = item.at_css('description').content.strip\
       unless item.at_css('description').nil?
      items[:date] = item.at_css('pubDate').content.strip\
       unless item.at_css('pubDate').nil?
      items[:enclosure] = item.at_css('enclosure').get_attribute('url').strip\
       unless item.at_css('enclosure').nil?
      items[:category] = item.at_css('category').content.strip\
       unless item.at_css('category').nil?

      result.push(items)
      items.reject!
    end
    result
  end
end
