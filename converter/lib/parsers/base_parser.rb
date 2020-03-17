module BaseParser
    def self.named(data)
        Main::PARSERS.each do |parser_name|
            return parser_name if Module.const_get(parser_name).can_parse?(data)
        end
    end
  
    def self.parse(data, named)
        Module.const_get(named).parse(data)
    end
  
    
end

