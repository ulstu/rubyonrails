# frozen_string_literal: true

# !/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'optparse'
require 'optparse/time'
require '../index'

url1 = 'https://lenta.ru/rss'        ##################################
url2 = 'https://mail.google.com/mail/feed/atom'
link = '{"threads":
   [{"posts":
   {"banned":0,
   "closed":0,
   "comment":""}}]}'                 ####################################

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
    options[:sort] = sort
  end
end.parse!

input = options[:input]
output = options[:output]

if input == 'json' && output == 'rss'
  format_json = FormatJson.new
  format_json.create_rss(link)

elsif input == 'json' && output == 'atom'
  format_json = FormatJson.new
  format_json.create_atom(link)

elsif input == 'rss' && output == 'json'
  format_rss = FormatRss.new
  format_rss.create_json(url1)

elsif input == 'rss' && output == 'atom'
  format_rss = FormatRss.new
  format_rss.create_atom(url1)

elsif input == 'atom' && output == 'json'
  format_atom = FormatAtom.new
  format_atom.create_json(url2)

elsif input == 'atom' && output == 'rss'
  format_atom = FormatAtom.new
  format_atom.create_rss(url2)

else puts 'Enter json, rss or atom format'
end
