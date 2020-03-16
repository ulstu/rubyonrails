# frozen_string_literal: true

# Convert to JSON
class JsonConvertor
  def initialize(convert_data)
    @convert_data = convert_data
  end

  def convert
    JSON.pretty_generate(@convert_data)
  end
end
