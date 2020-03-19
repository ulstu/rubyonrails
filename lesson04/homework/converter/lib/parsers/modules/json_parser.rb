# frozen_string_literal: true

require 'json'

# Methods for checking if we can parse and method for parse itself
module JsonParser
  def self.can_parse?(data)
    JSON.parse(data)
    true
  rescue JSON::ParserError => e
    false
  end

  def self.parse(data)
    data = JSON.parse(data)
  end
end
