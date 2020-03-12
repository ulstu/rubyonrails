require 'optparse'
require 'ostruct'
require 'uri'

module OptionsParser
  def self.options
    options = {}
    parser = OptionParser.new do |opt|
      opt.banner = 'Usage converter.rb [options]'
      opt.separator ''
      opt.on('-i', '--input [url | file]', 'The input link | file') do |input|
        options[:input] = input
      end
      opt.on('-o', '--output-format [format]',
             'The output format(rss | json | atom)') do |output|
        options[:output_format] = output
      end
      opt.on('-s', '--sort [asc | desc]', 'Sorting method') do |sort|
        options[:sort] = sort
      end

      opt.separator ''

      opt.on('-h', '--help', 'Show this message') do |help|
        puts opt
        exit
      end
    end

    parser.parse!
    options
  end
end
