#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rss'
require 'json'
require 'optparse'
require 'optparse/time'

# my class to save information
class RssElement
  attr_accessor :guid
  attr_accessor :title
  attr_accessor :links
  attr_accessor :description
  attr_accessor :pub_date
  attr_accessor :enclosure
  attr_accessor :category
  def initialize(guid, title, links, description, pub_date, enclosure, category)
    @guid = guid
    @title = title
    @links = links
    @description = description
    @pub_date = pub_date
    @enclosure = enclosure
    @category = category
  end

  def to_json(*all)
    {
      'guid' => guid,
      'title' => title,
      'links' => links,
      'descripttion' => description,
      'pubDate' => pub_date,
      'enclosure' => enclosure,
      'category' => category
    }.to_json(*all)
  end

  def to_rss
    "<guid>#{guid}</guid>\
    <title>#{title}</guid>\
    <link>#{links}</link>\
    <description>#{description}</description>\
    <pubDate>#{pub_date}</pubDate>\
    <enclosure>#{enclosure}</enclosure>\
    <category>#{category}</category>\n\n"
  end
end

options = {}
OptionParser.new do |parser|
  parser.on('--output=OUTPUT',
            'The output can be json, rss or atom file extension') do |output|
    options[:output] = output
  end

  parser.on('--input=INPUT', 'Enter the path to the file') do |input|
    options[:input] = input
  end

  parser.on('--sort[=asc]', 'Enter asc or desc') do |sort|
    puts "You required #{sort}!"
    options[:sort] = sort.to_s
  end
end.parse!

xmlfeed = Nokogiri::XML(open(options[:input]))
doc = xmlfeed.xpath('//item')
arr = []
i = 0
doc.each do |el|
  guid = el.at('guid').text
  title = el.at('title').text
  links = el.at('link').text
  description = el.at('description').text
  pub_date = el.at('pubDate').text
  enclosure = el.at('enclosure').text
  category = el.at('category').text
  rss_element = RssElement.new(guid, title, links, description,
                               pub_date, enclosure, category)
  arr[i] = rss_element
  i += 1
end

obj_json = JSON.dump(arr)
File.open('from_RSSto JSON', 'w') do |file|
  file.write(obj_json)
end

k = 0
json_from_rss = []
from_json = JSON.parse(obj_json)
from_json.each do |block|
  guid = block['guid']
  title = block ['title']
  links = block ['link']
  description = block ['description']
  pub_date = block ['pubDate']
  enclosure = block ['enclosure']
  category = block ['category']
  k += 1

  json_from_rss[k] = RssElement.new(guid, title, links, description,
                                    pub_date, enclosure, category).to_rss
end
File.open('from_jsonto rss', 'w') do |file|
  json_from_rss.each do |line|
    file.write(line.to_s)
  end
end

sorted_arr = arr
if options[:sort] == 'asc'
  sorted_arr = arr.sort_by { |v| v.pub_date }.to_a
  puts 'sorting asc'
elsif options[:sort] == 'desc'
  sorted_arr = arr.sort_by { |v| v.pub_date }.reverse.to_a
  puts 'sorting desc'
end
puts sorted_arr.to_json
