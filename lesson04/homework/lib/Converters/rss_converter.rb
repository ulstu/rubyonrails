# frozen_string_literal: true

# Module for convert array of hashes to rss format
module RssConverter
  def self.convert(input)
    builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.rss('version' => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom') do
        xml.channel do
          unless input[:head].nil?
            xml.language_ input[:head][:language]
            xml.title_ input[:head][:title]
            xml.description_ input[:head][:description]
            xml.link_ input[:head][:link]
            xml.image do
              unless input[:head][:image].nil?
                xml.url_ input[:head][:image][:url]
                xml.title_ input[:head][:image][:title]
                xml.link_ input[:head][:image][:link]
              end
            end
          end
          input[:content].each do |attr|
            xml.item do
              xml.guid_ attr[:guid]
              xml.title_ attr[:title]
              xml.link_ attr[:link]
              xml.description_ attr[:description]
              xml.pubDate_ attr[:date]
              xml.enclosure_('url' => attr[:enclosure])
              xml.category_ attr[:category]
            end
          end
        end
      end
    end
    builder.to_xml
  end
end
