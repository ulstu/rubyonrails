# frozen_string_literal: true

PARSERS = %w[JsonParser AtomParser RssParser].freeze

require 'require_all'
require_all '../lib'

# start
class Main
  def initialize(options)
    @input = options[:input]
    @output = options[:output]
    @sort = options[:sort]
  end

  def begin
    data = Reader.read(@input)
    parser_name = PARSERS.find do |parser|
      Module.const_get(parser).can_parse?(data)
    end
    parser_data = Module.const_get(parser_name).parse(data)
    SelectionConvertor.new(@output).convert(parser_data)
  end
end
