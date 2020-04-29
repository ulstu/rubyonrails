# frozen_string_literal: true

require 'nokogiri'

module RssParser
  def self.parse(data)
    doc = Nokogiri::XML(data)

    {feed: parse_feed(doc),
     items: parse_items(doc) }
  end

  def self.parse_feed(doc)
    {
      title: doc.at_css('channel title').text.strip,
      link: doc.at_css('channel link').text.strip
    }
  end

  def self.parse_items(doc)
    doc = doc.xpath('//item')
    arr = []
    doc.each do |item|
      hash = {
        title: item.at('title').text,
        description: item.at('description').text,
        link: item.at('link').text,
        date: item.at('pubDate').text,
        category: item.at('category').text
      }
      arr << hash
    end
    arr
  end


  def self.can_parse?(data)
    data.include?('<channel>')
  end
end
