# frozen_string_literal: true

class BaseConverter
  def initialize(output)
    @output = output
  end

  def convert(parsed_data)
    required_module = @output.capitalize << 'Converter'
      Module.const_get(required_module).convert(parsed_data)
  end
end
