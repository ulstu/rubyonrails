# frozen_string_literal: true

require 'nokogiri'

# Parse rss format
module RssParser
  def self.can_parse?(doc)
    doc = Nokogiri::XML(doc)
    doc.remove_namespaces!
    return true if doc.xpath('boolean(//item)')

    false
  end

  def self.parse_feed(doc)
    parsed_string = []
    feed_title = doc.at_css('channel title').text

    parsed_string.push(
      title: feed_title
    )
  end

  def self.parse_items(doc)
    items = []

    doc.css('item').each do |item|
      item_title = item.css('title').text.strip
      item_description = item.css('description').text.strip
      item_pubdate = item.css('pubDate').text.strip
      items.push(
        title: item_title,
        description: item_description,
        pubDate: item_pubdate
      )
    end
    items
  end

  def self.parse(doc)
    doc = Nokogiri::XML(doc)
    result = { # feed: parse_feed(doc),
      items: parse_items(doc)
    }
  end
end
