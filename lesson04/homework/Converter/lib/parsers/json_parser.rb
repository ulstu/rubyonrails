# frozen_string_literal: true

require 'json'

module ParseJson
  def self.parse(input)
    data = JSON.parse(input)
  end
end
