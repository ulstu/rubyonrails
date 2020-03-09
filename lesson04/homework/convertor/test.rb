require 'bundler/setup'
Bundler.require
require 'nokogiri'
require 'open-uri'
require 'rubocop'
require 'json'

xml_doc = Nokogiri::XML(open('https://lenta.ru/rss'))
doc = xml_doc.xpath("//item") 

obj = Hash.new
i = 0
doc.each do |item|
  obj2 = Hash.new
  item.children.each do |child|
    obj2[child.name] = child.content
  end
  obj[i] = obj2
  i += 1
end
#children[1].content #текст
#puts doc[0].children[1].name #key
tre = obj.to_json
puts obj[0].to_json