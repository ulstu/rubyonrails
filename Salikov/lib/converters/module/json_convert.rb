# frozen_string_literal: true

require 'json'

module JsonConvert
  def self.convert(data)
    JSON.pretty_generate(data)
  end
end
