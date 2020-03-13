# frozen_string_literal: true

require 'require_all'
require_all '../lib'

class Main
  def initialize(options)
    @input = options[:input]
    @output = options[:output]
    @sort = options[:sort]
  end

  def run
    data = BaseReader.read(@input)
    parsed_data = BaseParser.parse(data)
    convert_data = BaseConverter.new(@output)
    convert_data.convert(parsed_data)
  end
end
