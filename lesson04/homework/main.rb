# frozen_string_literal: true

require 'require_all'
require_all('lib')
require_all('tests')

# class converter
module Main
  READERS = ['LinkReader', 'FileReader'].freeze
  PARSERS = ['AtomParser', 'RssParser'].freeze
  @parser = ''
  @reader = ''

  def self.run(options = {})
    input_data = options['input']
    Main::READERS.map do |reader_name|
      @reader = reader_name if Module.const_get(reader_name).can_read?(input_data)
    end
    input_string = Module.const_get(@reader).read(input_data)
    Main::PARSERS.map do |parser_name|
      @parser = parser_name if Module.const_get(parser_name).can_parse?(input_string)
    end
    parsed_string = Module.const_get(@parser).parse(input_string)
    parsed_string
  end
end
