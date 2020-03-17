module BaseParser
    def self.named(data)
    parserName = ''
    PARSERS = ['JsonParser', 'AtomParser', 'RssParser']
    PARSERS.each do |parser_name|
      parserName = parser_name if Module.const_get(parser_name).can_parse?(data)
    end
    
end