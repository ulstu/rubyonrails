# frozen_string_literal: true

module BaseParsers
  def self.parse(data)
    Main::PARSERS.each do |parser_name|
      class_name = Module.const_get(parser_name)
      return class_name.parse(data) if class_name.can_parse?(data)
    end
  end
end
