require 'open-uri'
require 'require_all'
require_all '/Users/alex/Documents/MyProjects/ruby_project/rubyonrails/lib'

class Main
  def initialize(options)
    @input = options['input']
    @ouput = options['ouput']
    @sort = options['sort']
  end

  def run
      if input.include?('://')
      data = LinkReader.read(input)
      else data = FileReader.read(input)
      end

    if data_format(data) == 'rss'
      parsed_data = RssParser.parse(data)
    elsif data_format(data) == 'atom'
      parsed_data = AtomParser.parse(data)
    elsif data_format(data) == 'json'
      parsed_data = JsonParser.parse(data)
    end

     if @sort == 'asc'
      parsed_data = AscSorter.sort(parsed_data)
    else
      parsed_data = DescSorter.sort(parsed_data)
    end

    if @output == 'json'
      JsonConverter.convert(parsed_data)
    elsif @output == 'atom'
      AtomConverter.convert(parsed_data)
    elsif @ouput == 'rss'
      RssConverter.convert(parsed_data)
    end
  end

  def data_format(data)
    if data.include?( '<rss' )
      format = 'rss' 
    elsif data.include?( '<feed' )
      format = 'atom' 
    elsif data.include?( '{' )
      format = 'json' 
  end
  end
end
