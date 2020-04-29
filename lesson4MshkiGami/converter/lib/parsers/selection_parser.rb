# frozen_string_literal: true

# Select parsing
class SelectionParser
  def initialize(data)
    @data = data
  end

  def parse
    RssParser.new(@data).parse
    AtomParser.new(@data).parse
    JsonParser.new(@data).parse
  end
end
