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
    parsed_data = Parser.parse(data)
    sorted_data = @sort == 'desc' ? DescSorter.sort(parsed_data) : AscSorter.sort(parsed_data)
    converted_data = Converter.convert(sorted_data, @output)
  end

end