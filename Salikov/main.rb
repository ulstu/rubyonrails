# frozen_string_literal: true

require 'require_all'
require 'uri'
require_all '../lib/**/*.rb'

class Main
  PARSERS = %w[JsonParser RssParser AtomParser].freeze

  def initialize(options)
    @input = options[:input]
    @output_format = options[:output_format]
    @sort = options[:sort]
  end

  def run
    data = if @input =~ URI::DEFAULT_PARSER.make_regexp
             LinkReader.read(@input)
           elsif File.file?(@input)
             FileReader.read(@input)
           else
             puts 'ERROR: Not found file'
             exit
           end

    @input_format = BaseParsers.format(data)
    @parsed_data = @input_format.parse(data)
    puts parsed_data[:item][0]
    # # parsed_data = if @sort == 'asc'
    # #                 AscSorter.sort(parsed_data)
    # #               else
    # #                 DescSorter.sort(parsed_data)
    # #               end

    # if @output_format == 'json'
    #   ToJsonConvert.convert(parsed_data, input)
    # elsif @output_format == 'atom'
    #   ToAtomConvert.convert(parsed_data, input)
    # elsif @output_format == 'rss'
    #   ToRssConvert.convert(parsed_data, input)
    # end
  end
end
