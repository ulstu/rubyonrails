# frozen_string_literal: true

require 'nokogiri'

# Module for parsing atom format
module AtomParser
  def self.parse(input)
    xml_doc = Nokogiri::XML(input)
    xml_doc.remove_namespaces!
    result = {
      head: head_parse(xml_doc),
      content: entry_parse(xml_doc)
    }
    result
  end

  def self.can_parse?(input)
    unless (input =~ /feed/).nil?
      xml_doc = Nokogiri::XML(input)
      return true unless xml_doc.xpath('//feed/entry').nil?
    end

    false
  end

  def self.head_parse(xml_doc)
    {
      id: xml_doc.at_css('feed id').content.strip,
      title: xml_doc.at_css('feed title').content.strip,
      subtitle: xml_doc.at_css('feed subtitle').content.strip,
      updated: xml_doc.at_css('feed updated').content.strip,
      author: {
        name: xml_doc.at_css('feed author name').content.strip,
        email: xml_doc.at_css('feed author email').content.strip,
        uri: xml_doc.at_css('feed author uri').content.strip
      },
      link: xml_doc.at_css('feed link').get_attribute('href').strip,
      icon: xml_doc.at_css('feed icon').content.strip,
      logo: xml_doc.at_css('feed logo').content.strip,
      rights: xml_doc.at_css('feed rights').content.strip
    }
  end

  def self.entry_parse(xml_doc)
    result = []
    xml_doc.xpath('//entry').each do |item|
      result.push(
        {
          id: item.at_css('id').content.strip,
          title: item.at_css('title').content.strip,
          date: item.at_css('updated').content.strip,
          published: item.at_css('published').content.strip,
          rights: item.at_css('rights').content.strip,
          link: item.at_css('link').get_attribute('href').strip,
          summary: item.at_css('summary').content.strip,
          category: item.at_css('category').get_attribute('term').strip
        }
      )
    end
    result
  end
end
