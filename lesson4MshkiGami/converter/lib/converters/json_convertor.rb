# frozen_string_literal: true

# Convert to JSON
class JsonConvertor
  def self.convert(convert_data)
    JSON.pretty_generate(convert_data)
  end
end
