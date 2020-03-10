require 'bundler/setup'
Bundler.require
require 'nokogiri'
require 'open-uri'
require 'rubocop'
require 'json'
require 'require_all'
require_all 'lib'

class Main
  def initialize(options)
    @input = options['input']
    @ouput_format = options['ouput-format']
    @sort = options['sort']
  end

  def run
    data = "http://lenta.ru/rss"

    parsed_data = RssParser.parse(data)

    puts parsed_data[0].to_json

  end

  def run_old
    data = if @input == 'link'
             "http://lenta.ru/rss"
             "/home/user/file.txt"
             LinkReader.read(@input)
           elsif @input == 'file'
             FileReader.read(@input)
           end

    parsed_data = if data.format == 'rss'
                    "<xml type='Rss'>"
                    RssParser.parse(data)
                  elsif data.format == 'atom'
                    AtomParser.parse(data)
                  end

    parsed_data = if @sort == 'asc'
                    AscSorter.sort(parsed_data)
                  else
                    DescSorter.sort(parsed_data)
                  end

    if @output_format == 'json'
      JsonConverter.convert(parsed_data)
    elsif @output_format == 'atom'
      AtomConverter.convert(parsed_data)
    end
  end

  def data_format(data)
    format = nil
    "<xml type='Rss'>"

    format
  end
end