#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rss'
require 'json'
require 'optparse'
require 'optparse/time'


class Rss_element
    attr_accessor :guid
    attr_accessor :title
    attr_accessor :links
    attr_accessor :description
    attr_accessor :pubDate
    attr_accessor :enclosure
    attr_accessor :category
        def initialize (guid, title,links, description,pubDate,enclosure,category)
    @guid = guid
    @title = title
    @links = links 
    @description = description 
    @pubDate = pubDate
    @enclosure = enclosure
    @category = category
    
    end 

    def as_json(options = { })
    {
        "guid" => self.guid,
        "title" => self.title,
        "links" => self.links,
        "descripttion" => self.description,
        "pubDate" => self.pubDate,
        "enclosure" => self.enclosure,
        "category" => self.category,   
    }
    end
    
    def to_json(*a)
        as_json.to_json(*a)
    end
    

end

#class rss_pars

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
    options[:sort] = "#{sort}"
  end
end.parse!



xmlfeed = Nokogiri::XML(open( options[:input]))
doc = xmlfeed.xpath("//item")
arr = Hash.new
i = 0
doc.each do |el|
    guid = el.at('guid').text
    title = el.at('title').text
    links = el.at('link').text
    description = el.at('description').text
    pubDate = el.at('pubDate').text
    enclosure = el.at('enclosure').text
    category = el.at('category').text
    rss_element = Rss_element.new(guid, title,links, description,pubDate,enclosure,category)
    #arr.push(rss_element)
    arr[i] = rss_element
    i = i + 1
    end
    sorted_arr = arr
    if (options[:sort] == "asc")
        sorted_arr = arr.sort_by {|k, v| v.pubDate}.to_h
        puts "sorting asc"
    elsif (options[:sort] == "desc")
        sorted_arr = arr.sort_by {|k, v| v.pubDate}.reverse.to_h
        puts "sorting desc"
    end
    puts sorted_arr.to_json