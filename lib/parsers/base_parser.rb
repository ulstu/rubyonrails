# frozen_string_literal: true

module BaseParser
  def self.parse(data)
    if data.include?('<feed')
      AtomParser.parse(data)
    elsif data.include?('<item>')
      RssParser.parse(data)
    elsif data.include?('{')
      JsonParser.parse(data)
    end
  end
end
