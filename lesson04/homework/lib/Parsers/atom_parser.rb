# frozen_string_literal: true

require 'nokogiri'

# Module for parsing atom format
module AtomParser
  def self.parse(input)
    xml_doc = Nokogiri::XML(input)
    xml_doc.remove_namespaces!
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

  def self.can_parse?(input)
    unless (input =~ /feed/).nil?
      xml_doc = Nokogiri::XML(input)
      return true unless xml_doc.xpath('//feed/entry').nil?
    end

    false
  end
end
