# frozen_string_literal: true

require 'require_all'
require_all('lib')
require_all('tests')

# class converter
module Main
  READERS = %w[LinkReader FileReader].freeze
  PARSERS = %w[AtomParser RssParser JsonParser].freeze
  def self.program_run(options = {})
    raise 'This args are required' if options['input'].nil? || options['output'].nil?

    input_data = options['input']
    reader = Main::READERS.find do |reader_name|
      reader_name if Module.const_get(reader_name).can_read?(input_data)
    end
    input_string = Module.const_get(reader).read(input_data)
    parser = Main::PARSERS.find do |parser_name|
      parser_name if Module.const_get(parser_name).can_parse?(input_string)
    end
    parsed_string = Module.const_get(parser).parse(input_string)
    unless options['sort'].nil?
      sort_module = options['sort'].capitalize + 'Sorter'
      Module.const_get(sort_module).sort(parsed_string[:content])
    end
    convert = options['output'].capitalize + 'Converter'
    formatted_string = Module.const_get(convert).convert(parsed_string)
    FileWriter.write(formatted_string, options['output'])
  end
end
