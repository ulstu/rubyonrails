module Converter
  def self.convert(inputData, output)
    nameModule = output.capitalize + 'Converter';
    Module.const_get(nameModule).convert inputData
  end
end