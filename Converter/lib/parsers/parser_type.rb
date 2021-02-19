class ParserType
  def self.parse(data)
    parsers = choise_parsers()
    parsers.each do |parser|
      parser_class = Module.const_get(parser)
      can_parse = parser_class.can_parse?(data)
      return parser_class.parse(data) if can_parse
    end
  end

  def self.choise_parsers
    parsers = Dir["../lib/parsers/ext/*.rb"].map do |file|
      File.basename(file, ".*").split("_").map { |t| t.capitalize }.join()
    end
    parsers
  end
end
