require 'bundler/setup'
Bundler.require
require 'nokogiri'
require 'open-uri'
require 'rubocop'
require 'json'

xml_doc = Nokogiri::XML(open('https://lenta.ru/rss'))
data = [];
#Разбор элементов внутри item
doc = xml_doc.xpath("//item") 
doc.each do |item|
  obj = {};
  item.children.each do |child|
    obj[child.name] = child.content.chomp
  end
  data << obj
end
#children[1].content #текст
#puts doc[0].children[1].name #key
puts data[0].to_json