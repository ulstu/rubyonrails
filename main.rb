# frozen_string_literal: true

require 'require_all'
require_all '../lib'

class Main
  PARSERS = %w[JsonParser AtomParser RssParser].freeze

  def initialize(options)
    @input = options[:input]
    @output = options[:output]
    @sort = options[:sort]
  end

  def run
    data = BaseReader.read(@input)
    input_format = BaseParser.format(data)
    parsed_data = Module.const_get(input_format).parse(data)
    if @sort == 'asc' || @sort == 'desc'
      sorted_data = @sort == 'asc' ? AscSorter.sort(parsed_data) : DescSorter.sort(parsed_data)
      convert_data = BaseConverter.new(@output)
      convert_data.convert(sorted_data)
    elsif @sort.nil?
      convert_data = BaseConverter.new(@output)
      convert_data.convert(parsed_data)
    end
  end
end
