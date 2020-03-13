# frozen_string_literal: true

require 'nokogiri'

module RssParser
  def self.parse(data)
    doc = Nokogiri::XML(data)

    feed_inf = parse_feed(doc)
    items = parse_items(doc)
    result = { feed: feed_inf,
               item: items }
  end

  def self.parse_feed(doc)
    f_language = doc.at_css('channel language').text.strip
    f_title = doc.at_css('channel title').text.strip
    f_description = doc.at_css('channel description').text.strip
    f_link = doc.at_css('channel link').text.strip
    f_image = { 'url' => doc.css('channel image url').text.strip,
                'title' => doc.css('channel image title').text.strip,
                'link' => doc.css('channel image link').text.strip }

    feed_result = {
      language: f_language,
      title: f_title,
      description: f_description,
      link: f_link,
      image: f_image
    }
  end

  def self.parse_items(doc)
    doc.search('item').map do |item|
      item.children.reject(&:text?).map do |desc_child|
        if desc_child.name == 'enclosure'
          [desc_child.name, arr = tag_settings(desc_child)]
        else
          [desc_child.name, desc_child.text]
        end
      end.to_h
    end
  end

  def self.tag_settings(desc_child)
    name = desc_child.xpath('@*').map(&:name)
    enclosure_text = desc_child.xpath('@*')
    arr = {}
    (0...name.length).each do |i|
      arr[name[i]] = enclosure_text[i].text
    end
    arr
  end

  def self.can_parse?(data)
    data.include?('<channel>')
  end
end
