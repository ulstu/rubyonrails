# frozen_string_literal: true

require 'nokogiri'

# Class which converts hash data to RSS format
module ConvertToAtom
  def self.convert(data)
    builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.atom('version' => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom') do
        data.values[0].each do |v|
          xml.entry do
            xml.title v[:title]
            xml.summary v[:description]
            xml.published v[:pubdate]
          end
        end
      end
    end
    builder.to_xml
  end
end
