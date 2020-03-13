# frozen_string_literal: true

module InputFormat
  def self.format(data)
    Main::PARSERS.each do |parser_name|
      return parser_name if Module.const_get(parser_name).can_parse?(data)
    end
  end
end

# module InputFormat
#   def self.format(data)
#     format = if data.include?('<channel>')
#                'rss'
#              elsif data.include?('<feed')
#                'atom'
#              else
#                'json'
#              end
#     format
#   end
# end
