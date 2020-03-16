# frozen_string_literal: true

# Module for convert array of hashes to json format
module JsonConverter
  def self.convert(input)
    json_string = JSON.pretty_generate(input)
    json_string[0] = '{'
    json_string[-1] = '}'
    json_string
  end
end
