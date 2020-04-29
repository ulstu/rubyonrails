module BaseConverter
  def self.convert(data, option)
    Main::CONVERTES.each do |parser_name|
      class_name = Module.const_get(parser_name)
      return class_name.convert(data) if class_name.to_s.include?(option.to_s.capitalize)
    end
  end
end