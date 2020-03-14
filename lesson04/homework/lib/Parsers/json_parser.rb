# frozen_string_literal: true

require 'nokogiri'
require 'json'

# Module for parsing json format
module JsonParser
  NEEDED_ATTRIBUTES = %w[items entry].freeze
  def self.parse(input)
    result = []
    json = JSON.parse(input)
    JsonParser::NEEDED_ATTRIBUTES.each do |attr_name|
      unless json[attr_name].nil?
        json[attr_name].each do |item|
          result.push(items_parse(item))
        end
      end
    end
    result
  end

  def self.can_parse?(input)
    return true if input[0] == '{' && JSON.parse(input)

    false
  end

  def self.items_parse(item)
    result = {}
    item.each do |key, value|
      key = 'date' if key.include?('pubDate') || key.include?('updated')
      result.merge!({ key.to_sym => value })
    end
    result
  end
end
