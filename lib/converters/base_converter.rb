# frozen_string_literal: true

class BaseConverter
  def initialize(output)
    @output = output
  end

  def convert(parsed_data)
    if @output == 'json'
      JsonConverter.convert(parsed_data)
    elsif @output == 'atom'
      AtomConverter.convert(parsed_data)
    elsif @output == 'rss'
      RssConverter.convert(parsed_data)
    end
  end
end
