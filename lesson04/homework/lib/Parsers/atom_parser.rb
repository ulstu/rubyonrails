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
    xml_doc = Nokogiri::XML(input)
    input =~ /feed/ && xml_doc.xpath('//feed/entry')
  end

  def self.head_parse(xml_doc)
    result = {}
    xml_doc.xpath('//feed').each do |f|
      result[:id] = f.at_css('id').content.strip\
       unless f.at_css('id').nil?
      result[:title] = f.at_css('title').content.strip\
       unless f.at_css('title').nil?
      result[:subtitle] = f.at_css('subtitle').content.strip\
       unless f.at_css('subtitle').nil?
      result[:updated] = f.at_css('updated').content.strip\
       unless f.at_css('updated').nil?
      unless f.at_css('author').nil?
        result[:author] = {}
        result[:author][:name] = f.at_css('author name').content.strip\
         unless f.at_css('author name').nil?
        result[:author][:email] = f.at_css('author email').content.strip\
         unless f.at_css('author email').nil?
        result[:author][:uri] = f.at_css('author uri').content.strip\
         unless f.at_css('author uri').nil?
      end
      result[:link] = f.at_css('link').get_attribute('href').strip\
       unless f.at_css('link').nil?
      result[:icon] = f.at_css('icon').content.strip\
       unless f.at_css('icon').nil?
      result[:logo] = f.at_css('logo').content.strip\
       unless f.at_css('logo').nil?
      result[:rights] = f.at_css('rights').content.strip\
       unless f.at_css('rights').nil?
    end
    result
  end

  def self.entry_parse(xml_doc)
    result = []
    xml_doc.xpath('//entry').each do |item|
      entry = {}

      entry[:id] = item.at_css('id').content.strip\
       unless item.at_css('id').nil?
      entry[:title] = item.at_css('title').content.strip\
       unless item.at_css('title').nil?
      entry[:date] = item.at_css('updated').content.strip\
       unless item.at_css('updated').nil?
      entry[:published] = item.at_css('published').content.strip\
       unless item.at_css('published').nil?
      entry[:rights] = item.at_css('rights').content.strip\
       unless item.at_css('rights').nil?
      entry[:link] = item.at_css('link').get_attribute('href').strip\
       unless item.at_css('link').nil?
      entry[:summary] = item.at_css('summary').content.strip\
       unless item.at_css('summary').nil?
      entry[:category] = item.at_css('category').get_attribute('term').strip\
       unless item.at_css('category').nil?

      result.push(entry)
      entry.reject!
    end
    result
  end
end
