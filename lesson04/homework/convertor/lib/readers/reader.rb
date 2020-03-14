module Reader
  def self.read(input)
    files = NameFiles.find('lib/readers/ext/*.rb')

    data = ''
    files.each do |nameModule| 
      if (Module.const_get(nameModule).can? (input))
        data = Module.const_get(nameModule).read input
      end
    end
    data
  end
end
