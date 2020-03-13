# frozen_string_literal: true

require 'json'

module JsonParser
  def self.parse(data)
    a = JSON.parse(data)
  end

  def self.can_parse?(data)
    data.include?('\"items\"')
  end
end
