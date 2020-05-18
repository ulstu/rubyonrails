# frozen_string_literal: true

require 'nokogiri'

# Class which converts hash data to RSS format

module ConvertToRss
  def self.convert(data)
    builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.rss('version' => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom') do
        data.values[0].each do |v|
          xml.item do
            xml.title       v[:title]
            xml.description v[:description]
            xml.pubDate     v[:pubdate]
          end
        end
      end
    end
    builder.to_xml
  end
end
