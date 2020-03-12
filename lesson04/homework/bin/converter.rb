# frozen_string_literal: true

require 'require_all'
require_all('lib')
require_all('tests')

# class converter
class Converter
  def run
    options = OptionsParser.parse
    input_string = Reader.read(options['input'])
    unform_string = RssParser.parse(input_string)
    unform_string
  end
end
