module Converter
  def self.convert(inputData, output)
    nameModule = output.capitalize + 'Converter';
    Module.const_get(nameModule).convert inputData
    # data = []
    # filesNamed.each do |nameModule| 
    #   if (Module.const_get(nameModule).can? (inputData))
    #     data = Module.const_get(nameModule).parse inputData
    #   end
    # end
    # data
    # JsonConverter.convert(data)
  end
end