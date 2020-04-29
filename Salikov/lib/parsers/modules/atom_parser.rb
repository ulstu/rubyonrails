# frozen_string_literal: true
require 'nokogiri'

module AtomParser
  def self.parse(data)
    doc = Nokogiri::XML(data)
    {feed: parse_feed(doc),
     items: parse_items(doc)}
  end

  def self.parse_feed(doc)
    {
      title: doc.at_css('feed title').text.strip,
      link: doc.at_css('feed link').text.strip
    }
  end

  def self.parse_items(doc)
    arr = []
    doc.remove_namespaces!
    doc = doc.xpath('//entry')
    doc.each do |item|
      hash = {
        title: item.at('title').text,
        description: item.at('summary').text,
        link: item.at('link').text,
        date: item.at('published').text,
        category: item.at('category').text
      }
      arr << hash
    end
    arr
  end

  def self.can_parse?(data)
    data.include?('<feed')
  end
end
