require 'open-uri'
require 'nokogiri'
require 'json'
require 'rss'

url = 'https://lenta.ru/rss'
xml = open(url)

doc = Nokogiri::XML(xml)
itemMarker = doc.xpath('//item')
accomulator= []
i = 0
    itemMarker.search('item').each do |el|
    guid = el.at('guid').text
    title = el.at('title').text
    links = el.at('link').text
    description = el.at('description').text
    pubDate = el.at('pubDate').text
    enclosure = el.at('enclosure').text
    category = el.at('category').text
accomulator << {
      guid: guid,
      title: title,
      links: links,
      description: description,
      pubDate: pubDate,
      enclosure: enclosure,
      category: category,
      }
    i += 1
    end

puts JSON.pretty_generate(accomulator)


