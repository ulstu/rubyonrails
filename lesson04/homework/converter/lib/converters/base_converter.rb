# frozen_string_literal: true

module BaseConverter
  def self.convert(data, option)
    converters = ClassList.names('lib/converters/modules/*rb')
    converters.each do |converter|
      class_name = Module.const_get(converter)
      # puts class_name.to_s.include?(option.capitalize)
      if class_name.to_s.include?(option.capitalize)
        return class_name.convert(data)
      end
    end
  end
end
