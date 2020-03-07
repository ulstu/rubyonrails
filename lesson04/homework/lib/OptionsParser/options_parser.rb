# frozen_string_literal: true

require 'optparse'

# Module for parsing options from comand line
module OptionsParser
  @options = {}
  def self.parse
    OptionParser.new do |opts|
      option_parse(opts, 'input', '-iINPUT', '--input', 'A link or file')
      option_parse(opts, 'output', '-oOUTPUT', '--output-format', 'Output format (RSS, ATOM, JSON)')
      option_parse(opts, 'sort', '-sSORT', '--sort', 'Sorted by')
    end.parse!
    @options
  end

  # this method must be privated
  def self.option_parse(option, hash_name, short_key, key, descption)
    option.on(short_key, key, descption) do |opt|
      @options.merge!({ hash_name => opt })
    end
  end
end

OptionsParser.parse
