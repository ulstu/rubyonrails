# frozen_string_literal: true

# !/usr/bin/env ruby

require 'optparse'
require '../main'
require 'open-uri'
require 'nokogiri'
require 'json'
require '../lib/readers/link_reader'
require '../lib/readers/reader'
require '../lib/readers/file_reader'
require '../lib/parsers/atom_parser'
require '../lib/parsers/rss_parser'
require '../lib/parsers/json_parser'
require '../lib/parsers/parser'
require '../lib/converters/rss_converter'
require '../lib/converters/atom_converter'
require '../lib/converters/json_converter'
require '../lib/converters/converter'

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
    options[:sort] = sort
  end
end.parse!

main_program = Main.new(options)
main_program.run
