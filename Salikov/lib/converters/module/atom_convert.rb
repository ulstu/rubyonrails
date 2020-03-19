# frozen_string_literal: true

require 'nokogiri'

# Class which converts hash data to RSS format
module AtomConvert
  def self.convert(data)
    builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.rss('version' => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom') do
        xml.title data[:feed][:title]
        xml.link data[:feed][:link]
        data[:items].each do |v|
          xml.entry do
            xml.title v[:title]
            xml.summary v[:description]
            xml.link v[:link]
            xml.published v[:date]
            xml.category v[:category]
          end
        end
      end
    end
    builder.to_xml
  end
end