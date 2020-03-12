# frozen_string_literal: true

require 'nokogiri'
# Global module for parse
module Parser
  def self.parse(input_string)
    if !(input_string =~ /rss version/).nil?
      RssParser.parse(input_string)
    elsif input_string[0] == '{'
      JsonParser.parse(input_string)
    else
      AtomParser.parse(input_string)
    end
  end
end
