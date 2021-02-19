require 'open-uri'
require 'require_all'
require_rel 'lib'

class Main
  def initialize(options)
    @input = options[:input]
    @output = options[:output]
  end

  def run 
    data = Reader.read(@input)
    parsed_data = ParserType.parse(data)
    
    if @output == "json"
      JsonConverter.convert(parsed_data)
    elsif @output == "atom"
      AtomConverter.convert(parsed_data)
    elsif @output == "rss"
      RssConverter.convert(parsed_data)
    end
  end
end
