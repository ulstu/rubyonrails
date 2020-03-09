# frozen_string_literal: true

require 'nokogiri'

# desc
module RssParser
  def self.parse(input)
    xml_doc = Nokogiri::XML(input)
    {
      feed: rss_feed_parse(xml_doc),
      items: [rss_items_parse(xml_doc.xpath('//item'))]
    }
  end

  def self.rss_feed_parse(feed)
    {
      language: feed.at_css('channel language').children.to_s,
      title: feed.at_css('channel title').children.to_s,
      description: feed.at_css('channel description').children.to_s,
      link: feed.at_css('channel link').children.to_s,
      image: feed.at_css('channel image url').children.to_s
    }
  end

  def self.rss_items_parse(xml_doc_items)
    items = []
    xml_doc_items.each do |item|
      item_hash = Hash.new(0)
      item.children.each do |item_attr|
        content = item_attr.children.to_s
        if item_attr.name == 'enclosure'
          enclosure_hash = Hash.new(0)
          item_attr.each do |enclosure_item|
            enclosure_hash.merge!({ enclosure_item[0] => enclosure_item[1] })
          end
          content = [enclosure_hash]
        end
        item_hash.merge!({ item_attr.name => content }) unless content.empty?
      end
      items.push(item_hash)
    end
    items
  end
end
