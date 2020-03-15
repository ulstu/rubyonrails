module Parser

  def self.parse(inputData)
    filesNamed = NameFiles.find('lib/parsers/ext/*.rb')
    data = []
    filesNamed.each do |nameModule| 
      if (Module.const_get(nameModule).can? (inputData))
        data = Module.const_get(nameModule).parse inputData
      end
    end
    data
  end
end