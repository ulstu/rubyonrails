# frozen_string_literal: true

require 'nokogiri'

# This module parse Atom feed and entries
module AtomParser
  def self.can_parse?(doc)
    doc = Nokogiri::XML(doc)
    doc.remove_namespaces!
    return true if doc.xpath('boolean(//entry)')

    false
  end

  def self.parse_feed(doc)
    parsed_string = []
    feed_title = doc.at_css('feed title').text.strip

    parsed_string.push(
      title: feed_title
    )
  end

  def self.parse_entry(doc)
    items = []

    doc.css('entry').each do |item|
      entry_title = item.css('title').text.strip
      entry_summary = item.css('summary').text.strip
      entry_pubdate = item.css('published').text.strip
      items.push(
        title: entry_title,
        description: entry_summary,
        pubdate: entry_pubdate
      )
    end
    items
  end

  def self.parse(doc)
    doc = Nokogiri::XML(doc)
    doc.remove_namespaces!

    result = {
      # feed: parse_feed(doc),
      entry: parse_entry(doc)
    }
  end
end
