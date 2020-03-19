# frozen_string_literal: true

Dir['lib/parsers/modules/*.rb'].each do |file|
  require File.expand_path(file)
end

# parse data
module BaseParser
  def self.parse(data)
    parsers = ClassList.names('lib/parsers/modules/*rb')
    parsers.each do |parser|
      class_name = Module.const_get(parser)
      return class_name.parse(data) if class_name.can_parse?(data)
    end
  end
end
