# frozen_string_literal: true

module BaseParsers
  def self.format(data)
    Main::PARSERS.each do |parser_name|
      return parser_name if Module.const_get(parser_name).can_parse?(data)
    end
  end
end
