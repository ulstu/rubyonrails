require 'json'
require 'nokogiri'
require 'require_all'
require 'open-uri'
require_all '/home/mishigami/Desktop/RubyROSTELE/rubyonrails/lesson4MshkiGami/converter/lib'

builder = Nokogiri::XML::Builder.new do |xml|
    url1 = "test.xml"
    xml1 = open(url1)
    xml.root {
        xml.objects{
            xml1.each do |o|
                xml.objects {
                    xml.item   o.item
                }
            end
        }
    }
end
puts builder.to_xml
