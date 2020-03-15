module LinkReader
    def self.read(input)
      data = ''
      file_contents = open(input)
      file_contents.each do |line|
        data += line
      end
      data
    end
  end
  