# frozen_string_literal: true

# Select parsing
class SelectionConvertor
  def initialize(output)
    @output = output
  end

  def convert(data)
    if @output == 'rss'
      RssConvertor.new(data).convert
    elsif @output == 'atom'
      AtomConvertor.new(data).convert
    else
      JsonConvertor.new(data).convert
    end
  end
end
