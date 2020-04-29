# frozen_string_literal: true

require 'json'

module JsonParser
  def self.parse(data)
    res = JSON.parse(data)
  end

  def self.can_parse?(data)
    JSON.parse(data)
    true
  rescue JSON::ParserError => e
    false
  end
end
