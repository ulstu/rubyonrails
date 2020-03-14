require 'bundler/setup'
Bundler.require
require 'nokogiri'
require 'open-uri'
require 'rubocop'
require 'json'
require 'require_all'
require 'uri'
require_all 'lib'

class Main
  def initialize(options)
    @input = options[:input]
    @output = options[:output]
    @sort = options[:sort]
  end

  def run
    data = Reader.read(@input)
    parsed_data = RssParser.parse(data)
    sorted_data = AscSorter.sort(parsed_data)
    converted_data = JsonConverter.convert(sorted_data)
  end

end