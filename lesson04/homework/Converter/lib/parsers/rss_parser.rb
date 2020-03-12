# frozen_string_literal: true

require 'nokogiri'

module ParseRss
  def self.parseFeed(doc)
    parsedString = []
    feed_image_content = {}
    feed_language = doc.css('channel language').text.strip
    feed_title = doc.at_css('channel title').text
    feed_description = doc.at_css('channel description').text.strip
    feed_link = doc.at_css('channel link').text.strip
    feed_image_content = { 'url' => doc.css('channel image url').text.strip,
                           'title' => doc.css('channel image title').text.strip,
                           'link' => doc.css('channel image link').text.strip }

    parsedString.push(
      language: feed_language,
      title: feed_title,
      description: feed_description,
      link: feed_link,
      image: feed_image_content
    )
  end

  def self.parseItems(doc)
    items = []

    item_tags = doc.xpath('//item/*').map(&:name).each.uniq
    p item_tags
    doc.css('item').each do |item|
      parsed_strings = {}
      attr_names = []
      item_tags.each do |tag|
        attr_hash = {}
        if !doc.xpath("//item/#{tag}[@*]").empty? # if tag has attribute parse them
          attr_names = doc.xpath("//item/#{tag}/@*").map(&:name).each.uniq
          attr_names.each do |att|
            attr_hash[att] = item.css(tag)[0][att]
          end
          parsed_strings[tag] = attr_hash
        else
          item_result = item.css(tag.to_s).text.strip
          parsed_strings[tag] = item_result
        end
      end
      items.push << parsed_strings
    end
    items
  end

  def self.parse(doc)
    doc = Nokogiri::XML(doc)
    result = { feed: parseFeed(doc),
               items: parseItems(doc) }
  end
end
