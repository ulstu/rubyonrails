# frozen_string_literal: true

require 'require_all'
require 'uri'
require_all '../lib/**/*.rb'

class Main
  PARSERS = %w[JsonParser RssParser AtomParser].freeze
  CONVERTES = %w[JsonConvert RssConvert AtomConvert].freeze

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
    parsed_data = BaseParsers.parse(data)
    converted_data = BaseConverter.convert(parsed_data, @output_format)

    FileWriter.write(converted_data, @input)
  end
end
