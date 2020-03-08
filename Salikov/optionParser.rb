# frozen_string_literal: true

require 'optparse'
require 'ostruct'
require 'uri'
require './rssconverter.rb'

class OptionsConverter
  class ScriptOptions
    attr_accessor :input_poz, :input_format, :output_format

    def initialize
      self.input_poz = ''
      self.input_format = ''
      self.output_format = ''
    end

    def define_options(parser)
      parser.banner = 'Usage: example.rb [options]'
      parser.separator ''
      parser.separator 'Specific options:'

      # add additional options
      input_file(parser)
      output_file(parser)

      parser.separator ''
      parser.separator 'Common options:'
      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      parser.on_tail('-h', '--help', 'Show this message') do
        puts parser
        exit
      end
    end

    def input_file(parser)
      # find out the input file or link
      parser.on('-i', '--input [NAME]', 'The input link') do |link|
        self.input_poz = link
        if (link =~ /https?:\/\/.+/)
          self.input_format = 'rss'
        elsif File.file?(link)
          tmp = link.split('.')
          self.input_format = tmp[-1]
        else 
          puts "ERROR this file or link unknown #{link}"
        end
      end
    end

    def output_file(parser)
      parser.on('-o', '--output-format [NAME]', 'The output format') do |name|
        self.output_format = name
        if name == 'atom'
          # pass
        elsif name == 'rss'
          # pass
        elsif name == 'json'
          # pass
        else
          puts "Unknown format (#{name}) in which you want to format"
          exit
        end
        start_convert()
      end
    end

    def start_convert()
      if input_format == 'rss'
        output_format == 'json'? RssConverter.new.convert_to_json(input_poz) : 'atom'
      elsif input_format == 'json'
        # 
      elsif input_format == 'atom'
        # 
      end
    end
  end

  #
  # Return a structure describing the options.
  #
  def parse(args)
    # The options specified on the command line will be collected in
    # *options*.

    @options = ScriptOptions.new
    @args = OptionParser.new do |parser|
      @options.define_options(parser)
      parser.parse!(args)
    end
    @options
  end

  attr_reader :parser, :options
end

example = OptionsConverter.new
options = example.parse(ARGV)