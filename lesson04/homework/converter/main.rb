# frozen_string_literal: true

require 'nokogiri'

# Main class
class Main
  def initialize(options)
    @input = options[:input]
    @output = options[:output]
    @sort = options[:sort]
    @name = options[:name]
  end

  def run
    data = if @input.match('^https|http')
             Link_reader.read(@input)
           else
             File_reader.read(@input)
           end

    parsed_data = BaseParser.parse(data)
    converted_data = BaseConverter.convert(parsed_data, @output)
    FileWriter.write(converted_data, @name)
  end
end
