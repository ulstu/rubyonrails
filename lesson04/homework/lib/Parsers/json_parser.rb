# frozen_string_literal: true

require 'json'

# Module for parsing json format
module JsonParser
  NEEDED_ATTRIBUTES = %w[items entry].freeze
  def self.parse(input)
    items_array = []
    json = JSON.parse(input)
    JsonParser::NEEDED_ATTRIBUTES.each do |attr_name|
      next if json[attr_name].nil?

      json[attr_name].each do |item|
        items_array.push(items_parse(item))
      end
    end
    result = {
      head: nil,
      content: items_array
    }
    result
  end

  def self.can_parse?(input)
    input[0] == '{' && JSON.parse(input)
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
