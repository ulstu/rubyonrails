# frozen_string_literal: true

# Select parsing
class SelectionConvertor
  def self.choose(format)
    Module.const_get("#{format.capitalize}Convertor")
  rescue StandardError
    nil
  end
end
